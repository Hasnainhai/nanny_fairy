import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

class GetProviderInfoRepo{
  final DatabaseReference _providerRef =
      FirebaseDatabase.instance.ref().child('Providers');

  Future<Map<dynamic, dynamic>> getProvider() async {
    DatabaseEvent snapshot =
        await _providerRef.child(FirebaseAuth.instance.currentUser!.uid).once();
    return snapshot.snapshot.value as Map<dynamic, dynamic>;
  }
}
