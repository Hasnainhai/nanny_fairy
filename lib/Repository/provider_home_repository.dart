import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class ProviderHomeRepository {
  final DatabaseReference _bookingRef =
      FirebaseDatabase.instance.ref().child('Family');

  Future<Map<dynamic, dynamic>> getPopularJobs() async {
    DatabaseEvent snapshot = await _bookingRef.once();
    debugPrint(snapshot.snapshot.value.toString());
    return snapshot.snapshot.value as Map<dynamic, dynamic>;
  }
}
