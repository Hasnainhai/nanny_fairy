import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:nanny_fairy/Models/family_search_model.dart';

class FamilyFilterRepository extends ChangeNotifier {
  final DatabaseReference _familyRef =
      FirebaseDatabase.instance.ref().child('Providers');

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

    try {
      // Fetch the data from Firebase
      DataSnapshot snapshot = await _familyRef.get();
      List<ProviderSearchModel> allProviders = [];
      for (var element in snapshot.children) {
        if (element.value is Map) {
          var data = Map<String, dynamic>.from(element.value as Map);
          allProviders.add(ProviderSearchModel.fromMap(data, element.key!));
        }
      }
      debugPrint("All Providers: ${allProviders.length}");

      List<ProviderSearchModel> initialFilteredProviders = [];

      // Filter by hourly rate
      for (var provider in allProviders) {
        double rate = double.tryParse(provider.hoursrate) ?? 0.0;
        if (rate >= minRate && rate <= maxRate) {
          initialFilteredProviders.add(provider);
        }
      }
      debugPrint("After rate filter: ${initialFilteredProviders.length}");

      // Further filter by passions
      List<ProviderSearchModel> passionFilteredProviders = [];
      for (var provider in initialFilteredProviders) {
        if (selectedPassions.isEmpty ||
            provider.passions.any((passion) => selectedPassions
                .map((e) => e.toLowerCase())
                .contains(passion.toLowerCase()))) {
          passionFilteredProviders.add(provider);
        }
      }
      debugPrint("After passions filter: ${passionFilteredProviders.length}");

      // Final filter by availability
      List<ProviderSearchModel> availabilityFilteredProviders = [];
      for (var provider in passionFilteredProviders) {
        bool matchesAvailability = true;

        if (selectedAvailability.isNotEmpty) {
          for (var entry in selectedAvailability.entries) {
            String timeOfDay = entry.key;
            debugPrint("Checking availability for $timeOfDay");

            bool hasMatchingAvailability =
                provider.availability[timeOfDay]?.entries.any((dayEntry) {
                      String day = dayEntry.key;
                      bool isAvailable = dayEntry.value;
                      bool selectedAvailable = entry.value[day] ?? false;
                      debugPrint(
                          "Provider availability on $day during $timeOfDay: $isAvailable, selected availability: $selectedAvailable");
                      return selectedAvailable == isAvailable;
                    }) ??
                    false;

            if (!hasMatchingAvailability) {
              matchesAvailability = false;
              break;
            }
          }
        }

        if (matchesAvailability) {
          availabilityFilteredProviders.add(provider);
        }
      }

      // Use availability filter result or fallback to passions filter result
      _filteredProviders = availabilityFilteredProviders.isEmpty
          ? passionFilteredProviders
          : availabilityFilteredProviders;

      debugPrint(
          "After availability filter: ${availabilityFilteredProviders.length}");
      if (_filteredProviders.isEmpty) {
        debugPrint(
            "No providers match the availability filter, showing only rate and passion filtered results");
      }
    } catch (e) {
      debugPrint("Error filtering providers: $e");
    }

    _isLoading = false;
    notifyListeners();
  }
}
