import 'dart:convert';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart'; // Add this import for ChangeNotifier
import 'package:http/http.dart' as http;

class FamilyDistanceRepository extends ChangeNotifier {
  // Extend ChangeNotifier
  List<Map<String, dynamic>> _distanceFilterProviders = [];
  List<Map<String, dynamic>> get distanceFilterProviders =>
      _distanceFilterProviders;

  // Function to fetch provider data from Firebase
  Future<List<Map<String, dynamic>>> fetchProvidersData() async {
    final databaseReference =
        FirebaseDatabase.instance.ref().child('Providers');
    DatabaseEvent snapshot = await databaseReference.once();

    final data = snapshot.snapshot.value as Map<dynamic, dynamic>?;

    if (data == null) {
      return [];
    }

    List<Map<String, dynamic>> providerList = [];

    data.forEach((key, value) {
      if (value is Map<dynamic, dynamic>) {
        providerList.add(Map<String, dynamic>.from(value));
      }
    });

    return providerList;
  }

  // Function to get the current family address
  Future<String?> getFamilyAddress() async {
    var auth = FirebaseAuth.instance;
    final databaseReference = FirebaseDatabase.instance
        .ref()
        .child('Family')
        .child(auth.currentUser!.uid)
        .child('address');

    try {
      DatabaseEvent snapshot = await databaseReference.once();
      final address = snapshot.snapshot.value as String?;

      if (address != null) {
        return address;
      } else {
        print('No address found for the current family.');
        return null;
      }
    } catch (e) {
      print('Error fetching family address: $e');
      return null;
    }
  }

  // Function to get the distance in kilometers between two addresses
  Future<double> getDistanceInKm(String origin, String destination) async {
    String encodedOrigin = Uri.encodeComponent(origin);
    String encodedDestination = Uri.encodeComponent(destination);

    String url = 'https://maps.googleapis.com/maps/api/distancematrix/json'
        '?origins=$encodedOrigin'
        '&destinations=$encodedDestination'
        '&units=metric'
        '&key=AIzaSyCBUyZVjnq9IGxH9Zu6ACNRIJXtkfZ2iuQ'; // Replace with your actual API key

    http.Response response = await http.get(Uri.parse(url));
    print(response.body);

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

  // Function to filter providers based on distance from the current family address
  Future<void> filterProvidersByDistance(
      BuildContext context, double maxDistanceKm) async {
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
                Text("Getting Providers..."),
              ],
            ),
          ),
        );
      },
    );
    try {
      List<Map<String, dynamic>> providers = await fetchProvidersData();
      String? familyAddress = await getFamilyAddress();

      if (familyAddress == null) {
        Navigator.of(context).pop();
        return; // Exit if no family address is found
      }

      _distanceFilterProviders.clear(); // Clear previous results

      for (var provider in providers) {
        String? providerAddress = provider['address'] as String?;
        if (providerAddress == null) {
          print('Provider address is null, skipping this provider.');
          continue;
        }

        double distance = await getDistanceInKm(familyAddress, providerAddress);
        debugPrint(
            " This Provider ${provider['firstName'] + provider['lastName']} has been added ");
        if (distance <= maxDistanceKm) {
          _distanceFilterProviders.add(provider);
        }
      }

      notifyListeners(); // Notify listeners that the data has been updated
    } finally {
      Navigator.of(context)
          .pop(); // Ensure the loading dialog is hidden once processing is done
    }
  }

  void _showLoadingDialog(BuildContext context) {}

  void _hideLoadingDialog(BuildContext context) {
    Navigator.of(context).pop(); // Closes the loading dialog
  }
}
