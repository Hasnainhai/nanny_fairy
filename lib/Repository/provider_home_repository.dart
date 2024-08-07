import 'package:firebase_database/firebase_database.dart';

class ProviderHomeRepository {
  final DatabaseReference _bookingRef =
      FirebaseDatabase.instance.ref().child('Family');

  Future<Map<dynamic, dynamic>> getPopularJobs() async {
    DatabaseEvent snapshot = await _bookingRef.once();
    return snapshot.snapshot.value as Map<dynamic, dynamic>;
  }
}
