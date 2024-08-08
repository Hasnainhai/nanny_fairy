import 'package:flutter/material.dart';
import 'package:nanny_fairy/Models/search_model.dart';
import 'package:nanny_fairy/Repository/provider_home_repository.dart';

class ProviderHomeViewModel extends ChangeNotifier {
  final ProviderHomeRepository _providerHomeRepository;

  ProviderHomeViewModel(this._providerHomeRepository);

  bool _isLoading = false;

  bool get isLoading => _isLoading;
  List<SearchModel> _searchResults = [];
  String _searchPassion = '';
  List<SearchModel> get searchResults => _searchResults;

  Future<Map<dynamic, dynamic>> getPopularJobs() async {
    try {
      return await _providerHomeRepository.getPopularJobs();
    } finally {}
  }

  Future<void> fetchUsers() async {
    _setLoading(true);
    try {
      await _providerHomeRepository.fetchUsers();
      _searchResults =
          _providerHomeRepository.searchUsersByPassion(_searchPassion);
    } finally {
      _setLoading(false);
    }
  }

  void searchUsersByPassion(String passion) {
    _searchPassion = passion;
    _searchResults = _providerHomeRepository.searchUsersByPassion(passion);
    notifyListeners();
  }

  void _setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }
}
