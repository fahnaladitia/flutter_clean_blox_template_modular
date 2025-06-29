part of '../widgets.dart';

class BasicSwitch extends StatefulWidget {
  final bool initialValue;
  final ValueChanged<bool>? onChanged;
  final BasicSwitchType type;
  final BasicSwitchState state;
  final String? label;
  final Widget? activeIcon;
  final Widget? inactiveIcon;

  const BasicSwitch._({
    super.key,
    required this.initialValue,
    this.onChanged,
    required this.type,
    required this.state,
    this.label,
    this.activeIcon,
    this.inactiveIcon,
  });

  const BasicSwitch.android({
    Key? key,
    bool initialValue = false,
    ValueChanged<bool>? onChanged,
    BasicSwitchState state = BasicSwitchState.active,
    String? label,
  }) : this._(
         key: key,
         type: BasicSwitchType.android,
         initialValue: initialValue,
         onChanged: onChanged,
         state: state,
         label: label,
       );

  const BasicSwitch.ios({
    Key? key,
    bool initialValue = false,
    ValueChanged<bool>? onChanged,
    BasicSwitchState state = BasicSwitchState.active,
    String? label,
  }) : this._(
         key: key,
         type: BasicSwitchType.ios,
         initialValue: initialValue,
         onChanged: onChanged,
         state: state,
         label: label,
       );

  const BasicSwitch.native({
    Key? key,
    bool initialValue = false,
    ValueChanged<bool>? onChanged,
    BasicSwitchState state = BasicSwitchState.active,
    String? label,
  }) : this._(
         key: key,
         type: BasicSwitchType.native,
         initialValue: initialValue,
         onChanged: onChanged,
         state: state,
         label: label,
       );

  const BasicSwitch.icon({
    Key? key,
    bool initialValue = false,
    ValueChanged<bool>? onChanged,
    BasicSwitchState state = BasicSwitchState.active,
    String? label,
    Widget? activeIcon,
    Widget? inactiveIcon,
  }) : this._(
         key: key,
         type: BasicSwitchType.icon,
         initialValue: initialValue,
         onChanged: onChanged,
         state: state,
         label: label,
         activeIcon: activeIcon,
         inactiveIcon: inactiveIcon,
       );

  @override
  State<BasicSwitch> createState() => _BasicSwitchState();
}

class _BasicSwitchState extends State<BasicSwitch> {
  late bool _value;

  @override
  void initState() {
    super.initState();
    _value = widget.initialValue;
  }

  void _toggle() {
    if (widget.state == BasicSwitchState.disabled) return;
    setState(() => _value = !_value);
    widget.onChanged?.call(_value);
  }

  @override
  Widget build(BuildContext context) {
    final switchWidget = _buildSwitch(context);
    final labelText = widget.label;

    return Semantics(
      label: labelText,
      toggled: _value,
      enabled: widget.state == BasicSwitchState.active,
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: _toggle,
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
                    color: widget.state == BasicSwitchState.disabled
                        ? Theme.of(
                            context,
                          ).colorScheme.onSurface.withValues(alpha: 0.38)
                        : null,
                  ),
                ),
              ),
            switchWidget,
          ],
        ),
      ),
    );
  }

  Widget _buildSwitch(BuildContext context) {
    switch (widget.type) {
      case BasicSwitchType.android:
        return Switch(
          value: _value,
          onChanged: widget.state == BasicSwitchState.active
              ? _onChanged
              : null,
        );
      case BasicSwitchType.ios:
        return CupertinoSwitch(
          applyTheme: true,
          value: _value,
          onChanged: widget.state == BasicSwitchState.active
              ? _onChanged
              : null,
        );
      case BasicSwitchType.native:
        return Switch.adaptive(
          value: _value,
          applyCupertinoTheme: true,
          onChanged: widget.state == BasicSwitchState.active
              ? _onChanged
              : null,
        );
      case BasicSwitchType.icon:
        return Container(
          width: 38,
          height: 38,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: _value
                ? Theme.of(context).colorScheme.primary.withValues(
                    alpha: widget.state == BasicSwitchState.disabled ? 0.38 : 1,
                  )
                : Colors.white.withValues(alpha: 0.48),
          ),
          child: IconButton(
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(),
            splashRadius: 16,
            tooltip: widget.label,
            alignment: Alignment.center,
            iconSize: 28,
            icon: _value
                ? widget.activeIcon ??
                      const Icon(Icons.radio_button_checked_rounded)
                : widget.inactiveIcon ??
                      widget.activeIcon ??
                      const Icon(Icons.radio_button_unchecked),
            onPressed: widget.state == BasicSwitchState.active
                ? () => _onChanged(!_value)
                : null,
          ),
        );
    }
  }

  void _onChanged(bool value) {
    setState(() => _value = value);
    widget.onChanged?.call(value);
  }
}
