import 'package:flutter/material.dart';
import 'package:nanny_fairy/Models/search_model.dart';
import 'package:nanny_fairy/Repository/search_repository.dart';
import 'dart:async';

class SearchViewModel extends ChangeNotifier {
  final SearchRepository _searchRepository;
  Timer? _debounce;

  SearchViewModel(this._searchRepository);

  List<SearchModel> get users => _searchRepository.filteredUsers;
  bool get isLoading => _searchRepository.isLoading;

  Future<void> fetchUsers() async {
    await _searchRepository.fetchUsers();
    notifyListeners();
  }

  // Debounced search for users by passion
  void searchUsersByPassion(String passion) {
    if (_debounce?.isActive ?? false) _debounce!.cancel();
    _debounce = Timer(const Duration(milliseconds: 300), () {
      _searchRepository.searchUsersByPassion(passion);
      notifyListeners();
    });
  }

  @override
  void dispose() {
    _debounce?.cancel();
    super.dispose();
  }
}
