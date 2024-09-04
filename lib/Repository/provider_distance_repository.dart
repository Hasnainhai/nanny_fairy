import 'dart:convert';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ProviderDistanceRepository extends ChangeNotifier {
  final List<Map<String, dynamic>> _distanceFilteredFamilies = [];
  List<Map<String, dynamic>> get distanceFilteredFamilies =>
      _distanceFilteredFamilies;

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

  Future<String?> getProviderAddress() async {
    var auth = FirebaseAuth.instance;
    final databaseReference = FirebaseDatabase.instance
        .ref()
        .child('Providers')
        .child(auth.currentUser?.uid ?? '')
        .child('address');

    try {
      DatabaseEvent snapshot = await databaseReference.once();
      final address = snapshot.snapshot.value as String?;

      return address;
    } catch (e) {
      debugPrint('Error fetching provider address: $e');
      return null;
    }
  }

  Future<void> filterFamiliesByDistance(
      double maxDistanceKm, BuildContext context) async {
    try {
      List<Map<String, dynamic>> families = await fetchFamiliesData();
      String? providerAddress = await getProviderAddress();

      if (providerAddress == null) {
        return;
      }

      _distanceFilteredFamilies.clear();

      for (var family in families) {
        String? familyAddress = family['address'] as String?;

        if (familyAddress == null) {
          continue;
        }

        double distance = await getDistanceInKm(providerAddress, familyAddress);

        if (distance <= maxDistanceKm) {
          _distanceFilteredFamilies.add(family);
        }
      }

      notifyListeners();
    } catch (e) {
      debugPrint('Error filtering families: $e');
    }
  }

  Future<void> filterFamiliesByPassion(
      String passion, double distance, BuildContext context) async {
    try {
      // Clear the list first to reset the state
      _distanceFilteredFamilies.clear();

      // Fetch the data once
      List<Map<String, dynamic>> families = await fetchFamiliesData();

      if (passion.isEmpty) {
        // If the search text is empty, do not filter by passion, but by distance
        await filterFamiliesByDistance(distance, context);
      } else {
        // Otherwise, filter the families by passion
        for (var family in families) {
          List<dynamic>? familyPassions =
              family['FamilyPassions'] as List<dynamic>?;

          if (familyPassions != null) {
            // Check if any passion in the family's passions contains the input substring
            bool matches = familyPassions.any((p) =>
                p.toString().toLowerCase().contains(passion.toLowerCase()));

            if (matches) {
              _distanceFilteredFamilies.add(family);
            }
          }
        }
      }

      // Notify listeners outside of the loop to reduce redundant updates
      notifyListeners();

      debugPrint("Filtered families by passion: $_distanceFilteredFamilies");
    } catch (e) {
      debugPrint('Error filtering families by passion: $e');
    }
  }

  Future<double> getDistanceInKm(String origin, String destination) async {
    String encodedOrigin = Uri.encodeComponent(origin);
    String encodedDestination = Uri.encodeComponent(destination);

    String url = 'https://maps.googleapis.com/maps/api/distancematrix/json'
        '?origins=$encodedOrigin'
        '&destinations=$encodedDestination'
        '&units=metric'
        '&key=AIzaSyCBUyZVjnq9IGxH9Zu6ACNRIJXtkfZ2iuQ';

    http.Response response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);

      if (jsonResponse['rows'] != null &&
          jsonResponse['rows'].isNotEmpty &&
          jsonResponse['rows'][0]['elements'] != null &&
          jsonResponse['rows'][0]['elements'].isNotEmpty &&
          jsonResponse['rows'][0]['elements'][0]['status'] == 'OK') {
        var distance =
            jsonResponse['rows'][0]['elements'][0]['distance']['value'];
        return distance / 1000;
      } else {
        throw Exception('No valid data found in the API response.');
      }
    } else {
      throw Exception('Failed to fetch data: ${response.statusCode}');
    }
  }
}
