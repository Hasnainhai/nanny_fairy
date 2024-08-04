import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:nanny_fairy/utils/routes/routes_name.dart';
import 'package:nanny_fairy/utils/utils.dart';
import 'package:firebase_database/firebase_database.dart';

class AuthRepository {
  final FirebaseAuth _firebaseAuth;

  AuthRepository({
    FirebaseAuth? firebaseAuth,
  }) : _firebaseAuth = firebaseAuth ?? FirebaseAuth.instance;
  var databaseReference = FirebaseDatabase.instance.ref();

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
      Navigator.pushNamedAndRemoveUntil(
        context,
        RoutesName.registerDetails,
        (route) => false,
      );
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
      Utils.flushBarErrorMessage("Please fill in all fields", context);

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

      final userRef = databaseReference.child('Providers').child(userId);

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
      Navigator.pushNamedAndRemoveUntil(
        context,
        RoutesName.selectPassion,
        (route) => false,
      );
    } catch (e) {
      // Remove the loading indicator
      Navigator.of(context).pop();
      Utils.flushBarErrorMessage("Failed to save details", context);
      debugPrint(e.toString());
      // Show error message
    }
  }
}
