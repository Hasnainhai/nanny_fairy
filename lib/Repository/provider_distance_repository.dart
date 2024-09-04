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
    bool isDialogShown = false;
    bool dialogShowing = false;

    try {
      // Show loading dialog
      // isDialogShown = true;
      // dialogShowing = true;
      // showDialog(
      //   context: context,
      //   barrierDismissible: false,
      //   builder: (BuildContext context) {
      //     return const Dialog(
      //       child: Padding(
      //         padding: EdgeInsets.all(16.0),
      //         child: Row(
      //           mainAxisSize: MainAxisSize.min,
      //           children: [
      //             CircularProgressIndicator(),
      //             SizedBox(width: 16),
      //             Text("Getting Families..."),
      //           ],
      //         ),
      //       ),
      //     );
      //   },
      // );

      List<Map<String, dynamic>> families = await fetchFamiliesData();
      String? providerAddress = await getProviderAddress();
      debugPrint("this is families address : $families");
      debugPrint("this is provider address : $providerAddress");

      if (providerAddress == null) {
        // Hide dialog if it is shown
        // if (dialogShowing) {
        //   Navigator.of(context, rootNavigator: true).pop();
        //   dialogShowing = false;
        // }
        return;
      }

      _distanceFilteredFamilies.clear();

      for (var family in families) {
        String? familyAddress = family['address'] as String?;
        debugPrint("this is inside the loop: $familyAddress");

        if (familyAddress == null) {
          continue;
        }

        double distance = await getDistanceInKm(providerAddress, familyAddress);
        debugPrint("this is family map : $family");

        if (distance <= maxDistanceKm) {
          _distanceFilteredFamilies.add(family);
        }
      }

      // // Hide dialog if it is shown
      // if (dialogShowing) {
      //   Navigator.of(context, rootNavigator: true).pop();
      //   dialogShowing = false;
      // }

      notifyListeners();
    } catch (e) {
      debugPrint('Error filtering families: $e');
    } finally {
      // Ensure the dialog is hidden even if an error occurred
      // if (dialogShowing) {
      //   Navigator.of(context, rootNavigator: true).pop();
      //   dialogShowing = false;
      // }
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
