import 'package:flutter/material.dart';
import 'package:nanny_fairy/res/components/widgets/ui_enums.dart';

class HomeUiSwithchRepository extends ChangeNotifier {
  UIType _selectedType = UIType.DefaultSection;

  UIType get selectedType => _selectedType;

  void switchToType(UIType type) {
    _selectedType = type;
    notifyListeners();
  }

  void switchToDefaultSection() {
    switchToType(UIType.DefaultSection);
    notifyListeners();
  }
}
