part of '../widgets.dart';

class BasicSelectionController extends Cubit<BasicSelectionControllerState> {
  BasicSelectionController({
    bool initialValue = false,
    BasicSelectionState initialState = BasicSelectionState.active,
  }) : super(
         BasicSelectionControllerState(
           isSelected: initialValue,
           stateSelection: initialState,
         ),
       );

  void toggleSelection() {
    emit(state.copyWith(isSelected: !state.isSelected));
  }

  void setSelection(bool value) {
    if (state.isSelected != value) {
      emit(state.copyWith(isSelected: value));
    }
  }

  void changeState({BasicSelectionState? to}) {
    emit(state.copyWith(stateSelection: to));
  }
}

class BasicSelectionControllerState {
  final bool isSelected;
  final BasicSelectionState stateSelection;

  BasicSelectionControllerState({
    required this.isSelected,
    required this.stateSelection,
  });

  BasicSelectionControllerState copyWith({
    bool? isSelected,
    BasicSelectionState? stateSelection,
  }) {
    return BasicSelectionControllerState(
      isSelected: isSelected ?? this.isSelected,
      stateSelection: stateSelection ?? this.stateSelection,
    );
  }
}
