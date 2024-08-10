import 'package:flutter/material.dart';
import 'package:nanny_fairy/res/components/widgets/family_home_ui_enums.dart';

class FamilyHomeUiRepository extends ChangeNotifier {
  FamilyHomeUiEnums _selectedType = FamilyHomeUiEnums.DefaultSection;
  // JobUIType _selectedJobType = JobUIType.DefaultSection;

  // JobUIType get selectedJobType => _selectedJobType;
  FamilyHomeUiEnums get selectedType => _selectedType;

  void switchToType(FamilyHomeUiEnums type) {
    _selectedType = type;
    notifyListeners();
  }

  // void switchToJobType(JobUIType type) {
  //   _selectedJobType = type;
  //   notifyListeners();
  // }

  void switchToDefaultSection() {
    switchToType(FamilyHomeUiEnums.DefaultSection);
    notifyListeners();
  }

  // void switchToJobDefaultSection() {
  //   switchToJobType(JobUIType.DefaultSection);
  //   notifyListeners();
  // }
}
