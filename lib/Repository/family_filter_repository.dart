import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:nanny_fairy/Models/family_search_model.dart';

class FamilyFilterRepository extends ChangeNotifier {
  final DatabaseReference _familyRef =
      FirebaseDatabase.instance.ref().child('Provider');

  List<ProviderSearchModel> _filteredProviders = [];
  bool _isLoading = false;

  List<ProviderSearchModel> get filteredProviders => _filteredProviders;
  bool get isLoading => _isLoading;

  Future<void> filterProviders({
    required double minRate,
    required double maxRate,
    required List<String> selectedPassions,
    required Map<String, Map<String, bool>> selectedAvailability,
  }) async {
    _isLoading = true;
    notifyListeners();

    // Fetch the data from Firebase
    DataSnapshot snapshot = await _familyRef.get();
    List<ProviderSearchModel> allProviders = [];
    for (var element in snapshot.children) {
      var data = element.value as Map<String, dynamic>;
      allProviders.add(ProviderSearchModel.fromMap(data, element.key!));
    }

    // Filter by hourly rate
    _filteredProviders = allProviders.where((provider) {
      double rate = double.tryParse(provider.hoursrate) ?? 0.0;
      return rate >= minRate && rate <= maxRate;
    }).toList();

    // Filter by passions
    if (selectedPassions.isNotEmpty) {
      _filteredProviders = _filteredProviders.where((provider) {
        return provider.passions
            .any((passion) => selectedPassions.contains(passion.toLowerCase()));
      }).toList();
    }

    // Filter by availability
    if (selectedAvailability.isNotEmpty) {
      _filteredProviders = _filteredProviders.where((provider) {
        return selectedAvailability.entries.every((entry) {
          return provider.availability[entry.key]?.entries.any((dayEntry) {
                return entry.value[dayEntry.key] == dayEntry.value;
              }) ??
              false;
        });
      }).toList();
    }

    _isLoading = false;
    notifyListeners();
  }
}
