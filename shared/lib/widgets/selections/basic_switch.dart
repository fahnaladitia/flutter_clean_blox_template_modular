part of '../widgets.dart';

class BasicSwitch extends StatefulWidget {
  final ValueChanged<bool>? onChanged;
  final BasicSwitchType type;
  final BasicSelectionState state;
  final String? label;
  final bool isBackgroundColor;
  final Icon? activeIcon;
  final Icon? inactiveIcon;
  final Color? activeColor;
  final Color? activeBackgroundColor;
  final Color? inactiveColor;
  final Color? inactiveBackgroundColor;
  final double? elevation;
  final BasicSelectionController? controller;

  const BasicSwitch._({
    super.key,

    this.onChanged,
    required this.type,
    required this.state,
    this.label,
    this.activeIcon,
    this.inactiveIcon,
    this.isBackgroundColor = true,
    this.activeColor,
    this.activeBackgroundColor,
    this.inactiveColor,
    this.inactiveBackgroundColor,
    this.elevation,
    this.controller,
  });

  const BasicSwitch.android({
    Key? key,

    ValueChanged<bool>? onChanged,
    BasicSelectionState state = BasicSelectionState.active,
    String? label,
    Icon? activeIcon,
    Icon? inactiveIcon,
    Color? activeColor,
    Color? inactiveColor,
    Color? activeBackgroundColor,
    Color? inactiveBackgroundColor,
    BasicSelectionController? controller,
  }) : this._(
         key: key,
         type: BasicSwitchType.android,

         onChanged: onChanged,
         state: state,
         label: label,
         activeIcon: activeIcon,
         inactiveIcon: inactiveIcon,
         activeColor: activeColor,
         inactiveColor: inactiveColor,
         activeBackgroundColor: activeBackgroundColor,
         inactiveBackgroundColor: inactiveBackgroundColor,
         controller: controller,
       );

  const BasicSwitch.ios({
    Key? key,
    ValueChanged<bool>? onChanged,
    BasicSelectionState state = BasicSelectionState.active,
    String? label,
    Icon? activeIcon,
    Icon? inactiveIcon,
    Color? activeColor,
    Color? inactiveColor,
    Color? activeBackgroundColor,
    Color? inactiveBackgroundColor,
    BasicSelectionController? controller,
  }) : this._(
         key: key,
         type: BasicSwitchType.ios,

         onChanged: onChanged,
         state: state,
         label: label,
         activeIcon: activeIcon,
         inactiveIcon: inactiveIcon,
         activeColor: activeColor,
         inactiveColor: inactiveColor,
         activeBackgroundColor: activeBackgroundColor,
         inactiveBackgroundColor: inactiveBackgroundColor,
         controller: controller,
       );

  const BasicSwitch.adaptive({
    Key? key,
    ValueChanged<bool>? onChanged,
    BasicSelectionState state = BasicSelectionState.active,
    String? label,
    Icon? activeIcon,
    Icon? inactiveIcon,
    Color? activeColor,
    Color? inactiveColor,
    Color? activeBackgroundColor,
    Color? inactiveBackgroundColor,
    BasicSelectionController? controller,
  }) : this._(
         key: key,
         type: BasicSwitchType.adaptive,

         onChanged: onChanged,
         state: state,
         label: label,
         activeIcon: activeIcon,
         inactiveIcon: inactiveIcon,
         activeColor: activeColor,
         inactiveColor: inactiveColor,
         activeBackgroundColor: activeBackgroundColor,
         inactiveBackgroundColor: inactiveBackgroundColor,
         controller: controller,
       );

  const BasicSwitch.icon({
    Key? key,

    ValueChanged<bool>? onChanged,
    BasicSelectionState state = BasicSelectionState.active,
    String? label,
    Icon? activeIcon,
    Icon? inactiveIcon,
    Color? activeColor,
    Color? inactiveColor,
    Color? activeBackgroundColor,
    Color? inactiveBackgroundColor,
    double? elevation,
    bool isBackgroundColor = true,
    BasicSelectionController? controller,
  }) : this._(
         key: key,
         type: BasicSwitchType.icon,

         onChanged: onChanged,
         state: state,
         label: label,
         activeIcon: activeIcon,
         inactiveIcon: inactiveIcon,
         activeColor: activeColor,
         inactiveColor: inactiveColor,
         activeBackgroundColor: activeBackgroundColor,
         inactiveBackgroundColor: inactiveBackgroundColor,
         elevation: elevation,
         isBackgroundColor: isBackgroundColor,
         controller: controller,
       );

  @override
  State<BasicSwitch> createState() => _BasicSwitchState();
}

class _BasicSwitchState extends State<BasicSwitch> {
  late BasicSelectionController _controller;

  @override
  void initState() {
    super.initState();
    _controller = widget.controller ?? BasicSelectionController();
  }

  void _toggle() {
    if (widget.state == BasicSelectionState.disabled) return;
    // setState(() => _value = !_value);
    _controller.toggleSelection();
    widget.onChanged?.call(_controller.isSelected);
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => _controller,
      child: Consumer<BasicSelectionController>(
        builder: (context, state, child) {
          final isSelected = state.isSelected;
          final switchWidget = _buildSwitch(context, isSelected);
          final labelText = widget.label;
          return Semantics(
            label: labelText,
            checked: isSelected,
            enabled: widget.state == BasicSelectionState.active,
            child: GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: _toggle,
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
                          color: widget.state == BasicSelectionState.disabled
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
        },
      ),
    );
  }

  Widget _buildSwitch(BuildContext context, bool isSelected) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    switch (widget.type) {
      case BasicSwitchType.android:
        return Switch(
          value: isSelected,
          activeTrackColor: widget.activeBackgroundColor,
          inactiveTrackColor: widget.inactiveBackgroundColor,
          thumbIcon: _getIcon(context, isDarkMode, isSelected, widget.state),
          onChanged: widget.state == BasicSelectionState.active
              ? (bool value) => _onChanged()
              : null,
        );
      case BasicSwitchType.ios:
        return CupertinoSwitch(
          applyTheme: true,
          value: isSelected,
          activeTrackColor: widget.activeBackgroundColor,
          inactiveTrackColor: widget.inactiveBackgroundColor,
          thumbIcon: _getIcon(context, isDarkMode, isSelected, widget.state),
          onChanged: widget.state == BasicSelectionState.active
              ? (bool value) => _onChanged()
              : null,
        );
      case BasicSwitchType.adaptive:
        return Switch.adaptive(
          value: isSelected,
          activeTrackColor: widget.activeBackgroundColor,
          inactiveTrackColor: widget.inactiveBackgroundColor,
          thumbIcon: _getIcon(context, isDarkMode, isSelected, widget.state),
          applyCupertinoTheme: true,
          onChanged: widget.state == BasicSelectionState.active
              ? (bool value) => _onChanged()
              : null,
        );
      case BasicSwitchType.icon:
        return Container(
          width: 38,
          height: 38,
          decoration: BoxDecoration(
            boxShadow: widget.elevation != null
                ? [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.12),
                      blurRadius: widget.elevation!,
                      offset: const Offset(0, 2),
                    ),
                  ]
                : null,
            shape: BoxShape.circle,
            color: _getColorBackgroundIcon(
              context,
              isDarkMode,
              isSelected,
              widget.state,
            ),
          ),
          child: IconButton(
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(),
            splashRadius: 16,
            tooltip: widget.label,
            alignment: Alignment.center,
            iconSize: 28,
            isSelected: isSelected,
            color: _getColorIcon(context, isDarkMode, isSelected, widget.state),
            icon: isSelected
                ? widget.activeIcon ??
                      const Icon(Icons.radio_button_checked_rounded)
                : widget.inactiveIcon ??
                      widget.activeIcon ??
                      const Icon(Icons.radio_button_unchecked),
            onPressed: widget.state == BasicSelectionState.active
                ? () => _onChanged()
                : null,
          ),
        );
    }
  }

  void _onChanged() {
    _controller.toggleSelection();
    widget.onChanged?.call(_controller.isSelected);
  }

  Color _getColorBackgroundIcon(
    BuildContext context,
    bool isDarkMode,
    bool value,
    BasicSelectionState state,
  ) {
    if (!widget.isBackgroundColor) {
      return Colors.transparent;
    }
    if (widget.activeBackgroundColor != null && value) {
      return widget.activeBackgroundColor!;
    }

    if (widget.inactiveBackgroundColor != null && !value) {
      return widget.inactiveBackgroundColor!;
    }

    if (state == BasicSelectionState.disabled) {
      if (isDarkMode) {
        return Color(0xFF232429); // Disabled color
      }
      return Color(0xFFeeeff4); // Disabled color for light mode
    }

    if (isDarkMode) {
      return value
          ? Theme.of(context).colorScheme.primary
          : Color(0xFF333439); // Inactive color
    }
    return value
        ? Theme.of(context).colorScheme.primary
        : Theme.of(
            context,
          ).colorScheme.onSurface.withValues(alpha: 0.12); // Inactive color
  }

  Color _getColorIcon(
    BuildContext context,
    bool isDarkMode,
    bool value,
    BasicSelectionState state,
  ) {
    if (widget.activeColor != null && value) {
      return widget.activeColor!;
    }
    if (widget.inactiveColor != null && !value) {
      return widget.inactiveColor!;
    }

    if (state == BasicSelectionState.disabled) {
      if (isDarkMode) {
        return Colors.white.withValues(alpha: 0.48); // Disabled color
      }
      return Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.38);
    }

    if (!widget.isBackgroundColor) {
      return value
          ? Theme.of(context).colorScheme.primary
          : Colors.white.withValues(alpha: 0.38); // Inactive color
    }

    return Colors.white; // Active color
  }

  WidgetStateProperty<Icon?>? _getIcon(
    BuildContext context,
    bool isDarkMode,
    bool value,
    BasicSelectionState state,
  ) {
    return WidgetStateProperty.resolveWith((Set<WidgetState> states) {
      if (value) {
        final activeIconData = widget.activeIcon?.icon;
        if (widget.activeColor != null) {
          return Icon(
            activeIconData,
            color: _getColorIcon(context, isDarkMode, value, state),
          );
        }
        return widget.activeIcon;
      }

      if (value == false || state == BasicSelectionState.disabled) {
        final inactiveIconData = widget.inactiveIcon?.icon;
        if (widget.inactiveColor != null) {
          return Icon(
            inactiveIconData,
            color: _getColorIcon(context, isDarkMode, value, state),
          );
        }
        return widget.inactiveIcon;
      }

      return null;
    });
  }
}
