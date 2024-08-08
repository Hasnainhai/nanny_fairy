import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import '../res/components/common_firebase_storge.dart';
import '../utils/routes/routes_name.dart';
import '../utils/utils.dart';

class CommunityRepoFamily {
  final FirebaseAuth _firebaseAuth;

  CommunityRepoFamily({
    FirebaseAuth? firebaseAuth,
  }) : _firebaseAuth = firebaseAuth ?? FirebaseAuth.instance;
  var databaseReference = FirebaseDatabase.instance.ref();

  uploadFamilyPost(
    BuildContext context,
    File? post,
    String title,
    String content,
  ) async {
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
      var uuid = const Uuid().v1();
      final userId = _firebaseAuth.currentUser!.uid;
      final userRef =
          databaseReference.child('FamilyCommunityPosts').child(uuid);

      String postUrl =
          'https://nakedsecurity.sophos.com/wp-content/uploads/sites/2/2013/08/facebook-silhouette_thumb.jpg';

      if (post != null) {
        CommonFirebaseStorage commonStorage = CommonFirebaseStorage();
        postUrl = await commonStorage.storeFileFileToFirebase(
          'CommunityFamilyPost/$uuid',
          post,
        );
      } else {
        Utils.flushBarErrorMessage("Please pick The Profile Pic", context);
        Navigator.pop(context);
        return;
      }

      userRef.update({
        "post": postUrl,
        "title": title,
        "content": content,
        "userId": userId,
      });
      Navigator.of(context).pop();
      Utils.toastMessage('Images saved successfully!');
      debugPrint(userId);
      Navigator.pushNamedAndRemoveUntil(
        context,
        RoutesName.dashboardFamily,
        (route) => false,
      );
    } catch (e) {
      Navigator.of(context).pop();

      // Handle any errors that occur during save
      debugPrint('Error saving images: $e');
      Utils.flushBarErrorMessage('Failed to save Images', context);
    }
  }
}
