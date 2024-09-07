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
    debugPrint("this is address of providers:${snapshot.snapshot.value}");
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
      debugPrint("this is address of family:${snapshot.snapshot.value}");
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

  // Function to filter providers based on distance from the current family address
  // Function to get the distance in kilometers between two addresses
  Future<double> getDistanceInKm(String origin, String destination) async {
    // Validate addresses
    if (origin.isEmpty || destination.isEmpty) {
      throw Exception('Origin or destination address is empty');
    }

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

// In filterProvidersByDistance, ensure providerAddress and familyAddress are not null or empty
  Future<void> filterProvidersByDistance(
      BuildContext context, double maxDistanceKm) async {
    try {
      List<Map<String, dynamic>> providers = await fetchProvidersData();
      String? familyAddress = await getFamilyAddress();

      if (familyAddress == null || familyAddress.isEmpty) {
        print('No valid family address found');
        return; // Exit if no family address is found
      }

      _distanceFilterProviders.clear(); // Clear previous results

      for (var provider in providers) {
        String? providerAddress = provider['address'] as String?;
        debugPrint(
            "This is destination address $providerAddress of ${provider['firstName']}");

        if (providerAddress == null || providerAddress.isEmpty) {
          print('Provider address is null or empty, skipping this provider.');
          continue;
        }

        double distance = await getDistanceInKm(familyAddress, providerAddress);

        if (distance <= maxDistanceKm) {
          debugPrint(
              " This Provider ${provider['firstName'] + provider['lastName']} has been added ");
          _distanceFilterProviders.add(provider);
        }
      }

      notifyListeners(); // Notify listeners that the data has been updated
    } catch (e) {
      print('Error filtering providers by distance: $e');
    }
  }

  Future<void> filterFamiliesByPassion(
      String passion, double distance, BuildContext context) async {
    try {
      // Clear the list first to reset the state

      _distanceFilterProviders.clear();

      // Fetch the data once
      List<Map<String, dynamic>> providers = await fetchProvidersData();

      if (passion.isEmpty) {
        // If the search text is empty, do not filter by passion, but by distance
        await filterProvidersByDistance(context, distance);
      } else {
        // Otherwise, filter the families by passion
        for (var provider in providers) {
          List<dynamic>? providerPassions =
              provider['Passions'] as List<dynamic>?;

          if (providerPassions != null) {
            // Check if any passion in the family's passions contains the input substring
            bool matches = providerPassions.any((p) =>
                p.toString().toLowerCase().contains(passion.toLowerCase()));

            if (matches) {
              _distanceFilterProviders.add(provider);
            }
          }
        }
      }
      // Notify listeners outside of the loop to reduce redundant updates
      notifyListeners();

      debugPrint("Filtered providers by passion: $_distanceFilterProviders");
    } catch (e) {
      debugPrint('Error filtering providers by passion: $e');
    }
  }
}
