import 'dart:convert';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:http/http.dart' as http;

class FamilyDistanceRepository {
  // Function to fetch distance and duration from Google Distance Matrix API
  Future<void> getDistanceAndDuration(String origin, String destination) async {
    // Encoding the origin and destination parameters to handle spaces and special characters
    String encodedOrigin = Uri.encodeComponent(origin);
    String encodedDestination = Uri.encodeComponent(destination);

    // Updated URL with 'units=metric' for distances in kilometers
    String url = 'https://maps.googleapis.com/maps/api/distancematrix/json'
        '?origins=$encodedOrigin'
        '&destinations=$encodedDestination'
        '&units=metric' // Use 'metric' to get distances in kilometers
        '&key=AIzaSyCBUyZVjnq9IGxH9Zu6ACNRIJXtkfZ2iuQ'; // Replace with your actual API key

    http.Response response = await http.get(Uri.parse(url));
    print(response.body);

    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);

      if (jsonResponse['rows'].isNotEmpty &&
          jsonResponse['rows'][0]['elements'].isNotEmpty &&
          jsonResponse['rows'][0]['elements'][0]['status'] == 'OK') {
        var distance =
            jsonResponse['rows'][0]['elements'][0]['distance']['text'];
        var duration =
            jsonResponse['rows'][0]['elements'][0]['duration']['text'];

        print('Distance: $distance');
        print('Duration: $duration');
      } else {
        print('No valid data found in the API response.');
      }
    } else {
      throw Exception('Failed to fetch data: ${response.statusCode}');
    }
  }

  // Function to fetch provider data from Firebase
  Future<List<Map<String, dynamic>>> fetchProvidersData() async {
    final databaseReference =
        FirebaseDatabase.instance.ref().child('Providers');
    DatabaseEvent snapshot = await databaseReference.once();

    // Ensure that the snapshot value is of the expected type
    final data = snapshot.snapshot.value as Map<dynamic, dynamic>?;

    if (data == null) {
      // Handle the case where no data is found
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
        '&units=metric' // Use 'metric' to get distances in kilometers
        '&key=AIzaSyCBUyZVjnq9IGxH9Zu6ACNRIJXtkfZ2iuQ'; // Replace with your actual API key

    http.Response response = await http.get(Uri.parse(url));
    print(response.body);

    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);

      if (jsonResponse['rows'].isNotEmpty &&
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
  Future<List<Map<String, dynamic>>> filterProvidersByDistance(
      double maxDistanceKm) async {
    List<Map<String, dynamic>> providers = await fetchProvidersData();
    String? familyAddress = await getFamilyAddress();

    if (familyAddress == null) {
      return []; // Return an empty list if no family address is found
    }

    List<Map<String, dynamic>> nearbyProviders = [];

    for (var provider in providers) {
      String providerAddress = provider['address'];
      double distance = await getDistanceInKm("kkh Danyore", providerAddress);

      if (distance <= maxDistanceKm) {
        nearbyProviders.add(provider);
      }
    }

    return nearbyProviders;
  }
}
