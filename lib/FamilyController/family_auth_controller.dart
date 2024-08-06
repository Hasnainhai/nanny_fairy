import 'dart:io';

import 'package:flutter/material.dart';
import 'package:nanny_fairy/Repository/auth_repository.dart';
import 'package:nanny_fairy/Repository/family_auth_repository.dart';
import 'package:nanny_fairy/utils/utils.dart';

class FamilyAuthController extends ChangeNotifier {
  final AuthRepositoryFamily _authRepository;

  FamilyAuthController(this._authRepository);

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  Future<void> createAccount({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    _setLoading(true);
    try {
      if (email.isEmpty || password.isEmpty) {
        _setLoading(false);
        Utils.snackBar('Please Fill the fields', context);
      } else {
        await _authRepository.createAccount(
          email: email,
          password: password,
          context: context,
        );
      }
    } finally {
      _setLoading(false);
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
    _setLoading(true);
    try {
      await _authRepository.saveDetails(
        firstName: firstName,
        lastName: lastName,
        address: address,
        houseNumber: houseNumber,
        postCode: postCode,
        phoneNumber: phoneNumber,
        dob: dob,
        context: context,
      );
    } catch (e) {
      debugPrint('Error saving details: ${e.toString()}');
    } finally {
      _setLoading(false);
    }
  }

  Future<void> savePassion({
    required List<String> passionList,
    required BuildContext context,
  }) async {
    _setLoading(true);
    try {
      await _authRepository.savePassion(
        passionList,
        context,
      );
    } catch (e) {
      debugPrint('Error saving details: ${e.toString()}');
    } finally {
      _setLoading(false);
    }
  }

  // void _setLoading(bool value) {
  //   _isLoading = value;
  //   notifyListeners();
  // }
  Future<void> saveIdImages(
    BuildContext context,
    File? frontPic,
    File? backPic,
  ) async {
    _setLoading(true);
    try {
      await _authRepository.saveIdImages(context, frontPic, backPic);
    } catch (e) {
      debugPrint('Error saving details: ${e.toString()}');
    } finally {
      _setLoading(false);
    }
  }

  void _setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }
}
