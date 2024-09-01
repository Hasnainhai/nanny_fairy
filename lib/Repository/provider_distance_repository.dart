// ignore_for_file: use_build_context_synchronously

import 'dart:convert';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ProviderDistanceRepository extends ChangeNotifier {
  final List<Map<String, dynamic>> _distanceFilteredFamilies = [];
  List<Map<String, dynamic>> get distanceFilteredFamilies =>
      _distanceFilteredFamilies;

  // Function to fetch family data from Firebase
  Future<List<Map<String, dynamic>>> fetchFamiliesData() async {
    final databaseReference = FirebaseDatabase.instance.ref().child('Family');
    DatabaseEvent snapshot = await databaseReference.once();

    final data = snapshot.snapshot.value as Map<dynamic, dynamic>?;

    if (data == null) {
      return [];
    }

    List<Map<String, dynamic>> familyList = [];

    data.forEach((key, value) {
      if (value is Map<dynamic, dynamic>) {
        familyList.add(Map<String, dynamic>.from(value));
      }
    });

    return familyList;
  }

  // Function to get the current provider address
  Future<String?> getProviderAddress() async {
    var auth = FirebaseAuth.instance;
    final databaseReference = FirebaseDatabase.instance
        .ref()
        .child('Providers')
        .child(auth.currentUser!.uid)
        .child('address');

    try {
      DatabaseEvent snapshot = await databaseReference.once();
      final address = snapshot.snapshot.value as String?;

      if (address != null) {
        return address;
      } else {
        return null;
      }
    } catch (e) {
      debugPrint('Error fetching provider address: $e');
      return null;
    }
  }

  // Function to filter families based on distance from the current provider address
  Future<void> filterFamiliesByDistance(
      double maxDistanceKm, BuildContext context) async {
    showDialog(
      context: context,
      barrierDismissible:
          false, // Prevents dialog from being dismissed by tapping outside
      builder: (BuildContext context) {
        return const Dialog(
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                CircularProgressIndicator(),
                SizedBox(width: 16),
                Text("Getting Families..."),
              ],
            ),
          ),
        );
      },
    );
    List<Map<String, dynamic>> families = await fetchFamiliesData();
    String? providerAddress = await getProviderAddress();

    try {
      if (providerAddress == null) {
        Navigator.of(context).pop();
        return; // Exit if no provider address is found
      }

      // Clear the previous list to avoid adding duplicate entries
      _distanceFilteredFamilies.clear();

      for (var family in families) {
        String? familyAddress = family['address'] as String?;
        if (familyAddress == null) {
          continue; // Skip this family if the address is null
        }

        double distance = await getDistanceInKm(providerAddress, familyAddress);

        if (distance <= maxDistanceKm) {
          _distanceFilteredFamilies.add(family);
        }
      }
      Navigator.of(context).pop();

      // Notify listeners that the filtered list has been updated
      notifyListeners();
    } catch (e) {
      Navigator.of(context).pop();
    }
  }

  // Function to get the distance in kilometers between two addresses
  Future<double> getDistanceInKm(String origin, String destination) async {
    String encodedOrigin = Uri.encodeComponent(origin);
    String encodedDestination = Uri.encodeComponent(destination);

    String url = 'https://maps.googleapis.com/maps/api/distancematrix/json'
        '?origins=$encodedOrigin'
        '&destinations=$encodedDestination'
        '&units=metric' // Use 'metric' to get distances in kilometers
        '&key=AIzaSyCBUyZVjnq9IGxH9Zu6ACNRIJXtkfZ2iuQ'; // Replace with your actual API key

    http.Response response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);

      if (jsonResponse['rows'] != null &&
          jsonResponse['rows'].isNotEmpty &&
          jsonResponse['rows'][0]['elements'] != null &&
          jsonResponse['rows'][0]['elements'].isNotEmpty &&
          jsonResponse['rows'][0]['elements'][0]['status'] == 'OK') {
        var distance = jsonResponse['rows'][0]['elements'][0]['distance']
            ['value']; // Distance in meters
        return distance / 1000; // Convert to kilometers
      } else {
        throw Exception('No valid data found in the API response.');
      }
    } else {
      throw Exception('Failed to fetch data: ${response.statusCode}');
    }
  }
}
