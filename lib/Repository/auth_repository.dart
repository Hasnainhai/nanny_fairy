import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:nanny_fairy/utils/routes/routes_name.dart';
import 'package:nanny_fairy/utils/utils.dart';
import 'package:firebase_database/firebase_database.dart';

class AuthRepository {
  final FirebaseAuth _firebaseAuth;
  final DatabaseReference _databaseReference;

  AuthRepository({
    FirebaseAuth? firebaseAuth,
    DatabaseReference? databaseReference,
  })  : _firebaseAuth = firebaseAuth ?? FirebaseAuth.instance,
        _databaseReference =
            databaseReference ?? FirebaseDatabase.instance.ref();

  Future<void> createAccount({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    // Show loading indicator
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );

    try {
      await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      // Remove the loading indicator
      Navigator.of(context).pop();
      // Show success message or navigate to another screen
      Utils.toastMessage('Account created successfully!');
      Navigator.pushNamed(context, RoutesName.registerDetails);
    } on FirebaseAuthException catch (e) {
      // Remove the loading indicator
      Navigator.of(context).pop();
      // Show error message
      debugPrint(e.message);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Failed to create account: ${e.message}'),
        ),
      );
    }
  }

  Future<void> saveDetails({
    required String firstName,
    required String lastName,
    required String address,
    required String houseNumber,
    required String postCode,
    required String phoneNumber,
    required String dob,
    required BuildContext context,
  }) async {
    // Check if any field is empty
    if (firstName.isEmpty ||
        lastName.isEmpty ||
        address.isEmpty ||
        houseNumber.isEmpty ||
        postCode.isEmpty ||
        phoneNumber.isEmpty ||
        dob.isEmpty) {
      // Show a toast message
      Utils.toastMessage('Please fill in all fields');
      return;
    }

    // Show loading indicator
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );

    try {
      final userId = _firebaseAuth.currentUser?.uid;

      if (userId == null) {
        throw Exception('User not authenticated');
      }

      final userRef = _databaseReference.child('Providers').child(userId);

      await userRef.set({
        'firstName': firstName,
        'lastName': lastName,
        'address': address,
        'houseNumber': houseNumber,
        'postCode': postCode,
        'phoneNumber': phoneNumber,
        'dob': dob,
      });

      // Remove the loading indicator
      Navigator.of(context).pop();

      // Show success message
      Utils.toastMessage('Details saved successfully!');
    } catch (e) {
      // Remove the loading indicator
      Navigator.of(context).pop();

      // Show error message
      Utils.toastMessage('Failed to save details: ${e.toString()}');
    }
  }
}
