import 'dart:convert';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:http/http.dart' as http;

class ProviderDistanceRepository {
  List<Map<String, dynamic>> distanceFilteredFamilies = [];

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
        print('No address found for the current provider.');
        return null;
      }
    } catch (e) {
      print('Error fetching provider address: $e');
      return null;
    }
  }

  // Function to filter families based on distance from the current provider address
  Future<void> filterFamiliesByDistance(double maxDistanceKm) async {
    List<Map<String, dynamic>> families = await fetchFamiliesData();
    String? providerAddress = await getProviderAddress();

    if (providerAddress == null) {
      return; // Exit if no provider address is found
    }

    for (var family in families) {
      String? familyAddress = family['address'] as String?;
      if (familyAddress == null) {
        print('Family address is null, skipping this family.');
        continue; // Skip this family if the address is null
      }

      double distance = await getDistanceInKm(providerAddress, familyAddress);

      if (distance <= maxDistanceKm) {
        distanceFilteredFamilies.add(family);
      }
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
        '&key=YOUR_API_KEY_HERE'; // Replace with your actual API key

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
}
