import 'dart:io';

import 'package:flutter/material.dart';
import 'package:nanny_fairy/Repository/auth_repository.dart';

import '../Repository/community_repo_family.dart';

class FamilyCommunityController extends ChangeNotifier {
  final CommunityRepoFamily _communityRepoFamily;

  FamilyCommunityController(this._communityRepoFamily);

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  Future<void> uploadPostFamily(
    BuildContext context,
    File? post,
    String title,
    String content,
  ) async {
    _setLoading(true);
    try {
      await _communityRepoFamily.uploadFamilyPost(
          context, post, title, content);
    } catch (e) {
      debugPrint('Error uploading Post: ${e.toString()}');
    } finally {
      _setLoading(false);
    }
  }

  void _setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }
}
