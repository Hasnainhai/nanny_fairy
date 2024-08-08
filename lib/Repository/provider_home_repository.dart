import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:nanny_fairy/Models/search_model.dart';

class ProviderHomeRepository {
  final DatabaseReference _bookingRef =
      FirebaseDatabase.instance.ref().child('Family');

  Future<Map<dynamic, dynamic>> getPopularJobs() async {
    DatabaseEvent snapshot = await _bookingRef.once();
    debugPrint(snapshot.snapshot.value.toString());
    return snapshot.snapshot.value as Map<dynamic, dynamic>;
  }

  List<SearchModel> users = [];

  // Method to fetch data and assign it to the list
  Future<void> fetchUsers() async {
    try {
      DatabaseEvent snapshot = await _bookingRef.once();
      if (snapshot.snapshot.value != null) {
        final Map<dynamic, dynamic> data =
            snapshot.snapshot.value as Map<dynamic, dynamic>;
        List<SearchModel> fetchedUsers = [];
        data.forEach((key, value) {
          fetchedUsers.add(SearchModel.fromMap(value, key));
        });
        // Assign the fetched users to the users list
        users = fetchedUsers;
        debugPrint('Users fetched successfully');
      } else {
        debugPrint('No data found');
      }
    } catch (e) {
      debugPrint('Error fetching data: $e');
    }
  }

  // Method to search users by passion
  List<SearchModel> searchUsersByPassion(String passion) {
    return users.where((user) => user.passions.contains(passion)).toList();
  }
}
