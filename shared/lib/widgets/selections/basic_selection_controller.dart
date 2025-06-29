part of '../widgets.dart';

class BasicSelectionController extends ChangeNotifier {
  late bool _isSelected;
  late BasicSelectionState _state;

  BasicSelectionController({
    bool initialValue = false,
    BasicSelectionState state = BasicSelectionState.active,
  }) {
    _state = state;
    _isSelected = initialValue;
  }

  bool get isSelected => _isSelected;
  BasicSelectionState get state => _state;

  void toggleSelection() {
    _isSelected = !_isSelected;
    notifyListeners();
  }

  void changeState(BasicSelectionState state) {
    _state = state;
    notifyListeners();
  }
}
