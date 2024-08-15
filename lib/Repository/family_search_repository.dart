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
          if (value is Map<dynamic, dynamic>) {
            try {
              // Cast value to Map<String, dynamic>
              final Map<String, dynamic> providerData =
                  Map<String, dynamic>.from(value);

              // Handle specific fields that may cause issues, for example, 'Availability'
              if (providerData['Availability'] is Map<dynamic, dynamic>) {
                providerData['Availability'] = (providerData['Availability']
                        as Map<dynamic, dynamic>)
                    .map((k, v) => MapEntry(k.toString(),
                        v as bool)); // Assuming 'Availability' is Map<String, bool>
              }

              fetchedProviders
                  .add(ProviderSearchModel.fromMap(providerData, key));
            } catch (e) {
              debugPrint('Error processing provider $key: $e');
            }
          } else {
            debugPrint('Unexpected data format for provider $key: $value');
          }
        });

        providers = fetchedProviders;
        debugPrint('Fetched providers: $providers');
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
    fetchUsers();
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
