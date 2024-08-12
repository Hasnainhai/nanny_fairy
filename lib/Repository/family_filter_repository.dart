import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class FilteredRepository extends ChangeNotifier {
  final DatabaseReference _familyRef = FirebaseDatabase.instance
      .ref()
      .child('Provider'); // final SearchRepository _searchRepository;
  // List<> _filteredUsers = [];

  // FilteredRepository(this._searchRepository);

  // List<SearchModel> get filteredUsers => _filteredUsers;

  // void filterUsersByMultiplePassions(List<String> passions) {
  //   _filteredUsers = _searchRepository.users
  //       .where((user) => user.passions.any((passion) => passions.any(
  //           (query) => passion.toLowerCase().startsWith(query.toLowerCase()))))
  //       .toList();
  //   notifyListeners();
  // }
}
