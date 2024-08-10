import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:nanny_fairy/Models/family_search_model.dart';

class FamilySearchRepository extends ChangeNotifier {
  final DatabaseReference _providerRef =
      FirebaseDatabase.instance.ref().child('Providers');
  List<ProviderSearchModel> providers = [];
  List<ProviderSearchModel> filteredProviders = [];
  bool _isLoading = true;

  List<ProviderSearchModel> get users => providers;
  List<ProviderSearchModel> get filteredUsers => filteredProviders;
  bool get isLoading => _isLoading;

  // Fetch users from Firebase and assign to the list
  Future<void> fetchUsers() async {
    _isLoading = true;
    notifyListeners();

    try {
      DatabaseEvent snapshot = await _providerRef.once();
      if (snapshot.snapshot.value != null) {
        final Map<dynamic, dynamic> data =
            snapshot.snapshot.value as Map<dynamic, dynamic>;
        List<ProviderSearchModel> fetchedProviders = [];
        data.forEach((key, value) {
          fetchedProviders.add(ProviderSearchModel.fromMap(value, key));
        });
        providers = fetchedProviders;
      } else {
        debugPrint('No data found');
      }
    } catch (e) {
      debugPrint('Error fetching data: $e');
    }

    _isLoading = false;
    notifyListeners();
  }

  // Search users by passion from the list
  void searchUsersByPassion(String query) {
    print("This is the query : $query");

    if (query.isEmpty) {
      filteredProviders = providers;
    } else {
      filteredProviders = providers
          .where((providers) => providers.passions.any((passion) {
                final passionLower = passion.toLowerCase();
                final queryLower = query.toLowerCase();
                final match = passionLower.contains(queryLower);
                print(
                    "Checking passion: $passionLower, Query: $queryLower, Match: $match");
                return match;
              }))
          .toList();
    }
    print(
        "Filtered Users: ${filteredProviders.map((user) => user.passions).toList()}");
    notifyListeners();
  }
}
