import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:nanny_fairy/utils/routes/routes_name.dart';
import '../../res/components/colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final DatabaseReference _dbRef =
      FirebaseDatabase.instance.ref().child('Providers');

  @override
  void initState() {
    super.initState();
    checkUserSession();
  }

  Future<void> checkUserSession() async {
    User? user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      final userId = user.uid;
      final isProvider = await checkIfUserIsProvider(userId);

      if (isProvider) {
        // Navigate to the Provider Dashboard
        Navigator.pushNamedAndRemoveUntil(
          context,
          RoutesName.dashboard,
          (Route<dynamic> route) => false,
        );
      } else {
        // Navigate to the Family Dashboard
        Navigator.pushNamedAndRemoveUntil(
          context,
          RoutesName.dashboardFamily,
          (Route<dynamic> route) => false,
        );
      }
    } else {
      // If the user is new or not logged in, navigate to the Login/Signup view
      Timer(const Duration(seconds: 5), () {
        Navigator.pushNamedAndRemoveUntil(
          context,
          RoutesName.loginOrSignup,
          (Route<dynamic> route) => false,
        );
      });
    }
  }

  Future<bool> checkIfUserIsProvider(String id) async {
    final snapshot = await _dbRef.orderByChild('uid').equalTo(id).once();
    return snapshot.snapshot.exists;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColor.whiteColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("images/splash.png"),
                fit: BoxFit.contain,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
