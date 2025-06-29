import 'package:flutter/material.dart';

class BasicSelectionController extends ChangeNotifier {
  late bool _isSelected;

  BasicSelectionController({bool initialValue = false}) {
    _isSelected = initialValue;
  }

  bool get isSelected => _isSelected;

  void toggleSelection() {
    _isSelected = !_isSelected;
    notifyListeners();
  }
}
