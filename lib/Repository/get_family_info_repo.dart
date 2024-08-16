import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

class GetFamilyInfoRepo{
  final DatabaseReference _familyRef =
  FirebaseDatabase.instance.ref().child('Family');

  Future<Map<dynamic, dynamic>> getFamily() async {
    DatabaseEvent snapshot =
    await _familyRef.child(FirebaseAuth.instance.currentUser!.uid).once();
    return snapshot.snapshot.value as Map<dynamic, dynamic>;
  }
}
