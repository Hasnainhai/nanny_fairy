import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

class GetFamilyInfoRepo {
  final DatabaseReference _familyRef =
      FirebaseDatabase.instance.ref().child('Family');
  String? familyName;
  String? familyProfile;
  String? senderId;

  // Existing function to get family data
  Future<Map<dynamic, dynamic>> getFamily() async {
    DatabaseEvent snapshot =
        await _familyRef.child(FirebaseAuth.instance.currentUser!.uid).once();
    return snapshot.snapshot.value as Map<dynamic, dynamic>;
  }

  // New function to fetch and assign current family info
  Future<void> fetchCurrentFamilyInfo() async {
    DatabaseEvent snapshot =
        await _familyRef.child(FirebaseAuth.instance.currentUser!.uid).once();
    final data = snapshot.snapshot.value as Map<dynamic, dynamic>;

    String? firstName = data['firstName'];
    String? lastName = data['lastName'];
    familyName =
        (firstName != null && lastName != null) ? '$firstName $lastName' : null;

    familyProfile = data['profilePic'];
    senderId = FirebaseAuth.instance.currentUser!.uid;
  }
}
