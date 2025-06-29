part of '../widgets.dart';

class BasicCheckbox extends StatefulWidget {
  final bool initialValue;
  final ValueChanged<bool>? onChanged;
  final BasicCheckboxType type;
  final BasicSelectionState state;
  final String? label;
  final Color? checkColor;
  final Color? backgroundColor;
  const BasicCheckbox._({
    super.key,
    required this.initialValue,
    this.onChanged,
    required this.type,
    required this.state,
    this.label,
    this.checkColor,
    this.backgroundColor,
  });

  const BasicCheckbox.android({
    Key? key,
    required bool initialValue,
    ValueChanged<bool>? onChanged,
    String? label,
    Color? checkColor,
    Color? backgroundColor,
    BasicSelectionState state = BasicSelectionState.active,
  }) : this._(
         key: key,
         initialValue: initialValue,
         onChanged: onChanged,
         type: BasicCheckboxType.android,
         label: label,
         checkColor: checkColor,
         backgroundColor: backgroundColor,
         state: state,
       );

  const BasicCheckbox.ios({
    Key? key,
    required bool initialValue,
    ValueChanged<bool>? onChanged,
    String? label,
    Color? checkColor,
    Color? backgroundColor,
    BasicSelectionState state = BasicSelectionState.active,
  }) : this._(
         key: key,
         initialValue: initialValue,
         onChanged: onChanged,
         type: BasicCheckboxType.ios,
         label: label,
         checkColor: checkColor,
         backgroundColor: backgroundColor,
         state: state,
       );

  const BasicCheckbox.adaptive({
    Key? key,
    required bool initialValue,
    ValueChanged<bool>? onChanged,
    String? label,
    Color? checkColor,
    Color? backgroundColor,
    BasicSelectionState state = BasicSelectionState.active,
  }) : this._(
         key: key,
         initialValue: initialValue,
         onChanged: onChanged,
         type: BasicCheckboxType.adaptive,
         label: label,
         checkColor: checkColor,
         backgroundColor: backgroundColor,
         state: state,
       );

  @override
  State<BasicCheckbox> createState() => _BasicCheckboxState();
}

class _BasicCheckboxState extends State<BasicCheckbox> {
  late bool _value;

  @override
  void initState() {
    super.initState();
    _value = widget.initialValue;
  }

  @override
  Widget build(BuildContext context) {
    final checkWidget = _buildCheck(context);
    final labelText = widget.label;

    return Semantics(
      label: labelText,
      checked: _value,
      enabled: widget.state == BasicSelectionState.active,
      child: GestureDetector(
        onTap: _toggle,
        behavior: HitTestBehavior.opaque,
        child: Row(
          mainAxisAlignment: labelText != null
              ? MainAxisAlignment.spaceBetween
              : MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: labelText != null ? MainAxisSize.max : MainAxisSize.min,
          children: [
            if (labelText != null)
              Padding(
                padding: 16.edgeRight,
                child: Text(
                  labelText,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: widget.state == BasicSelectionState.disabled
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
  }

  Widget _buildCheck(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final checkColor =
        widget.checkColor ??
        (isDarkMode ? Theme.of(context).colorScheme.secondary : Colors.white);
    final backgroundColor =
        widget.backgroundColor ??
        (isDarkMode
            ? Theme.of(context).colorScheme.secondary
            : Theme.of(context).colorScheme.primary);

    double desiredSize = 24.0;

    switch (widget.type) {
      case BasicCheckboxType.android:
        return Transform.scale(
          scale: desiredSize / 24.0,
          child: Checkbox(
            value: _value,

            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4),
            ),
            onChanged: widget.state == BasicSelectionState.disabled
                ? null
                : (value) => _toggle(),
            checkColor: checkColor,
            activeColor: backgroundColor,
          ),
        );
      case BasicCheckboxType.ios:
        return Transform.scale(
          scale: desiredSize / 18.0,
          child: CupertinoCheckbox(
            value: _value,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4),
            ),
            onChanged: widget.state == BasicSelectionState.disabled
                ? null
                : (value) => _toggle(),
            checkColor: checkColor,
            activeColor: backgroundColor,
          ),
        );
      case BasicCheckboxType.adaptive:
        return Transform.scale(
          scale: desiredSize / 18.0,
          child: Checkbox.adaptive(
            value: _value,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4),
            ),
            onChanged: widget.state == BasicSelectionState.disabled
                ? null
                : (value) => _toggle(),
            checkColor: checkColor,
            activeColor: backgroundColor,
          ),
        );
    }
  }

  void _toggle() {
    if (widget.state == BasicSelectionState.disabled) return;
    setState(() => _value = !_value);
    widget.onChanged?.call(_value);
  }
}
