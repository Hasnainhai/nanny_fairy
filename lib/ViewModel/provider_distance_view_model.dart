import 'package:flutter/material.dart';
import 'package:nanny_fairy/Repository/provider_distance_repository.dart';

class ProviderDistanceViewModel extends ChangeNotifier {
  final ProviderDistanceRepository _providerDistanceRepository;

  ProviderDistanceViewModel(this._providerDistanceRepository);

  bool _isLoading = false;

  bool get isLoading => _isLoading;
  List<Map<String, dynamic>> get distanceFilteredFamilies =>
      _providerDistanceRepository.distanceFilteredFamilies;

  // List<Map<String, dynamic>> get searchedFamilies =>
  //     _providerDistanceRepository.searchedFamilies;

  Future<void> filterFamiliesByDistance(
      double maxDistanceKm, BuildContext context) async {
    _setLoading(true);
    try {
      await _providerDistanceRepository.filterFamiliesByDistance(
          maxDistanceKm, context);
      notifyListeners();
    } finally {
      _setLoading(false);
    }
  }

  // void searchFamiliesByPassion(String query) {
  //   _providerDistanceRepository.searchFamiliesByPassion(query);
  //   notifyListeners();
  // }

  void _setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }
}
