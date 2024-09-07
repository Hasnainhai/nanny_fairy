import 'dart:convert';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart'; // Add this import for ChangeNotifier
import 'package:http/http.dart' as http;

class FamilyDistanceRepository extends ChangeNotifier {
  List<Map<String, dynamic>> _distanceFilterProviders = [];
  List<Map<String, dynamic>> get distanceFilterProviders =>
      _distanceFilterProviders;

  bool _isActive = true;

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
  Future<double> getDistanceInKm(String origin, String destination) async {
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

  // Function to filter providers based on distance from the current family address
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
      Map<String, Map<String, dynamic>> uniqueProviders =
          {}; // Map to store unique providers

      for (var provider in providers) {
        String? providerUid = provider['uid']?.toString().trim();
        String? providerAddress =
            provider['address']?.toString().trim(); // Trim the address

        debugPrint(
            "Checking provider ${provider['firstName']} ${provider['lastName']} with address: $providerAddress");

        // Skip if provider UID or address is invalid
        if (providerUid == null ||
            providerAddress == null ||
            providerAddress.isEmpty ||
            provider['bio'] == null) {
          print(
              'Provider ${provider['firstName']} ${provider['lastName']} with address $providerAddress is null, empty, or invalid. Skipping.');
          continue;
        }

        // Fetch the distance between the family address and the provider address
        double distance = await getDistanceInKm(familyAddress, providerAddress);
        debugPrint(
            "Distance between family and provider ${provider['firstName']} is $distance km");

        // Check if the provider is within the specified distance
        if (distance <= maxDistanceKm) {
          if (uniqueProviders.containsKey(providerUid)) {
            print(
                'Duplicate provider found: ${provider['firstName']} ${provider['lastName']}');
          }

          // Add or update the provider in the map (overwrite if duplicate UID)
          uniqueProviders[providerUid] = provider;
          debugPrint(
              "Adding/updating provider ${provider['firstName']} ${provider['lastName']} with distance $distance km");
        }
      }

      // Convert map values to list
      _distanceFilterProviders.addAll(uniqueProviders.values);
      debugPrint(
          "this is length of the distanceFilterProvider list:${_distanceFilterProviders.length}");

      if (_isActive) {
        notifyListeners(); // Notify listeners that the data has been updated
      }
    } catch (e) {
      print('Error filtering providers by distance: $e');
    }
  }

  // Function to filter providers by passion and distance
  Future<void> filterFamiliesByPassion(
      String passion, double distance, BuildContext context) async {
    try {
      _distanceFilterProviders.clear(); // Clear previous results

      List<Map<String, dynamic>> providers = await fetchProvidersData();
      Set<String> seenProviderAddresses =
          {}; // To track processed providers by address

      if (passion.isEmpty) {
        await filterProvidersByDistance(context, distance);
      } else {
        for (var provider in providers) {
          List<dynamic>? providerPassions =
              provider['Passions'] as List<dynamic>?;

          if (providerPassions != null &&
              providerPassions.any((p) =>
                  p.toString().toLowerCase().contains(passion.toLowerCase())) &&
              !seenProviderAddresses.contains(provider['address'])) {
            _distanceFilterProviders.add(provider);
            seenProviderAddresses.add(
                provider['address']); // Add to the set to prevent duplicates
          }
        }
      }

      if (_isActive) {
        notifyListeners(); // Notify listeners after filtering
      }
    } catch (e) {
      debugPrint('Error filtering providers by passion: $e');
    }
  }

  // Method to deactivate the repository
  void deactivate() {
    _isActive = false;
  }

  // Method to activate the repository
  void activate() {
    _isActive = true;
  }
}
