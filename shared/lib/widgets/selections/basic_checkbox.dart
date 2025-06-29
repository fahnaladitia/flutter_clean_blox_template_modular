part of '../widgets.dart';

class BasicCheckbox extends StatefulWidget {
  final BasicSelectionController? controller;
  final ValueChanged<bool>? onChanged;
  final BasicCheckboxType type;
  final String? label;
  final Color? checkColor;
  final Color? backgroundColor;
  const BasicCheckbox._({
    super.key,
    required this.controller,
    this.onChanged,
    required this.type,
    this.label,
    this.checkColor,
    this.backgroundColor,
  });

  const BasicCheckbox.android({
    Key? key,
    BasicSelectionController? controller,
    ValueChanged<bool>? onChanged,
    String? label,
    Color? checkColor,
    Color? backgroundColor,
    BasicSelectionState state = BasicSelectionState.active,
  }) : this._(
         key: key,
         controller: controller,
         onChanged: onChanged,
         type: BasicCheckboxType.android,
         label: label,
         checkColor: checkColor,
         backgroundColor: backgroundColor,
       );

  const BasicCheckbox.ios({
    Key? key,
    BasicSelectionController? controller,
    ValueChanged<bool>? onChanged,
    String? label,
    Color? checkColor,
    Color? backgroundColor,
    BasicSelectionState state = BasicSelectionState.active,
  }) : this._(
         key: key,
         controller: controller,
         onChanged: onChanged,
         type: BasicCheckboxType.ios,
         label: label,
         checkColor: checkColor,
         backgroundColor: backgroundColor,
       );

  const BasicCheckbox.adaptive({
    Key? key,
    BasicSelectionController? controller,
    ValueChanged<bool>? onChanged,
    String? label,
    Color? checkColor,
    Color? backgroundColor,
    BasicSelectionState state = BasicSelectionState.active,
  }) : this._(
         key: key,
         controller: controller,
         onChanged: onChanged,
         type: BasicCheckboxType.adaptive,
         label: label,
         checkColor: checkColor,
         backgroundColor: backgroundColor,
       );

  @override
  State<BasicCheckbox> createState() => _BasicCheckboxState();
}

class _BasicCheckboxState extends State<BasicCheckbox> {
  late BasicSelectionController _controller;

  @override
  void initState() {
    super.initState();
    _controller = widget.controller ?? BasicSelectionController();
  }

  void _toggle() {
    final state = _controller.state;
    if (state.isDisabled) return;
    _controller.toggleSelection();
    final isSelected = _controller.isSelected;
    widget.onChanged?.call(isSelected);
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => _controller,
      child: Consumer<BasicSelectionController>(
        builder: (context, controller, _) {
          final state = controller.state;
          final isSelected = controller.isSelected;
          final checkWidget = _buildCheck(context);
          final labelText = widget.label;
          return Semantics(
            label: labelText,
            checked: isSelected,
            enabled: state.isActive,
            child: GestureDetector(
              onTap: _toggle,
              behavior: HitTestBehavior.opaque,
              child: Row(
                mainAxisAlignment: labelText != null
                    ? MainAxisAlignment.spaceBetween
                    : MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: labelText != null
                    ? MainAxisSize.max
                    : MainAxisSize.min,
                children: [
                  if (labelText != null)
                    Padding(
                      padding: 16.edgeRight,
                      child: Text(
                        labelText,
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: state.isDisabled
                              ? Theme.of(
                                  context,
                                ).colorScheme.onSurface.withValues(alpha: 0.38)
                              : null,
                        ),
                      ),
                    ),
                  checkWidget,
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildCheck(BuildContext context) {
    final isSelected = _controller.isSelected;
    final state = _controller.state;
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final checkColor =
        widget.checkColor ??
        (isDarkMode ? Theme.of(context).colorScheme.primary : Colors.white);
    final backgroundColor =
        widget.backgroundColor ??
        (isDarkMode
            ? Theme.of(context).colorScheme.secondaryContainer
            : Theme.of(context).colorScheme.primary);

    double desiredSize = 24.0;

    switch (widget.type) {
      case BasicCheckboxType.android:
        return Transform.scale(
          scale: desiredSize / 24.0,
          child: Checkbox(
            value: isSelected,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4),
            ),
            onChanged: state.isDisabled ? null : (value) => _toggle(),
            checkColor: checkColor,
            activeColor: backgroundColor,
          ),
        );
      case BasicCheckboxType.ios:
        return Transform.scale(
          scale: desiredSize / 18.0,
          child: CupertinoCheckbox(
            value: isSelected,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4),
            ),
            onChanged: state.isDisabled ? null : (value) => _toggle(),
            checkColor: checkColor,
            activeColor: backgroundColor,
          ),
        );
      case BasicCheckboxType.adaptive:
        return Transform.scale(
          scale: desiredSize / 18.0,
          child: Checkbox.adaptive(
            value: isSelected,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4),
            ),
            onChanged: state.isDisabled ? null : (value) => _toggle(),
            checkColor: checkColor,
            activeColor: backgroundColor,
          ),
        );
    }
  }
}
