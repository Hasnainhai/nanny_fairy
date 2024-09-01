import 'package:flutter/material.dart';
import 'package:nanny_fairy/Repository/family_distance_repository.dart';

class FamilyDistanceViewModel extends ChangeNotifier {
  final FamilyDistanceRepository _familyDistanceRepository;

  FamilyDistanceViewModel(this._familyDistanceRepository);

  bool _isLoading = false;

  bool get isLoading => _isLoading;
  List<Map<String, dynamic>> get distanceFilteredProviders =>
      _familyDistanceRepository.distanceFilterProviders;

  Future<void> filterProvidersByDistance(
      double maxDistanceKm, BuildContext context) async {
    _setLoading(true);
    try {
      await _familyDistanceRepository.filterProvidersByDistance(
          context, maxDistanceKm);
      notifyListeners(); // Notify listeners to update the UI
    } finally {
      _setLoading(false);
    }
  }

  void _setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }
}
