import 'package:flutter/material.dart';
import 'package:nanny_fairy/res/components/widgets/family_home_ui_enums.dart';
import 'package:nanny_fairy/res/components/widgets/family_job_enums.dart';

class FamilyHomeUiRepository extends ChangeNotifier {
  FamilyHomeUiEnums _selectedType = FamilyHomeUiEnums.DefaultSection;
  FamilyJobEnums _selectedJobType = FamilyJobEnums.DefaultSection;

  FamilyJobEnums get selectedJobType => _selectedJobType;
  FamilyHomeUiEnums get selectedType => _selectedType;

  void switchToType(FamilyHomeUiEnums type) {
    _selectedType = type;
    notifyListeners();
  }

  void switchToJobType(FamilyJobEnums type) {
    _selectedJobType = type;
    notifyListeners();
  }

  void switchToDefaultSection() {
    switchToType(FamilyHomeUiEnums.DefaultSection);
    notifyListeners();
  }

  void switchToJobDefaultSection() {
    switchToJobType(FamilyJobEnums.DefaultSection);
    notifyListeners();
  }
}
