import 'package:flutter/material.dart';
import 'package:nanny_fairy/Repository/provider_distance_repository.dart';

class ProviderDistanceViewModel extends ChangeNotifier {
  final ProviderDistanceRepository _providerDistanceRepository;

  ProviderDistanceViewModel(this._providerDistanceRepository);

  bool _isLoading = false;

  bool get isLoading => _isLoading;
  List<Map<String, dynamic>> get distanceFilteredFamilies =>
      _providerDistanceRepository.distanceFilteredFamilies;
  Future<void> filterFamiliesByDistance(double maxDistanceKm) async {
    _setLoading(true);
    try {
      await _providerDistanceRepository.filterFamiliesByDistance(maxDistanceKm);
      notifyListeners();
    } finally {
      _setLoading(false);
    }
  }

  void _setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }
}
