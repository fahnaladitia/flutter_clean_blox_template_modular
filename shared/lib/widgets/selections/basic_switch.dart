part of '../widgets.dart';

class BasicSwitch extends StatefulWidget {
  final BasicSelectionController? controller;
  final ValueChanged<bool>? onChanged;
  final BasicSwitchType type;
  final String? label;
  final bool isBackgroundColor;
  final Icon? activeIcon;
  final Icon? inactiveIcon;
  final Color? activeColor;
  final Color? activeBackgroundColor;
  final Color? inactiveColor;
  final Color? inactiveBackgroundColor;
  final double? elevation;

  const BasicSwitch._({
    super.key,
    this.controller,
    this.onChanged,
    required this.type,
    this.label,
    this.activeIcon,
    this.inactiveIcon,
    this.isBackgroundColor = true,
    this.activeColor,
    this.activeBackgroundColor,
    this.inactiveColor,
    this.inactiveBackgroundColor,
    this.elevation,
  });

  const BasicSwitch.android({
    Key? key,
    BasicSelectionController? controller,
    ValueChanged<bool>? onChanged,
    String? label,
    Icon? activeIcon,
    Icon? inactiveIcon,
    Color? activeColor,
    Color? inactiveColor,
    Color? activeBackgroundColor,
    Color? inactiveBackgroundColor,
  }) : this._(
         key: key,
         controller: controller,
         type: BasicSwitchType.android,
         onChanged: onChanged,
         label: label,
         activeIcon: activeIcon,
         inactiveIcon: inactiveIcon,
         activeColor: activeColor,
         inactiveColor: inactiveColor,
         activeBackgroundColor: activeBackgroundColor,
         inactiveBackgroundColor: inactiveBackgroundColor,
       );

  const BasicSwitch.ios({
    Key? key,
    BasicSelectionController? controller,
    ValueChanged<bool>? onChanged,
    String? label,
    Icon? activeIcon,
    Icon? inactiveIcon,
    Color? activeColor,
    Color? inactiveColor,
    Color? activeBackgroundColor,
    Color? inactiveBackgroundColor,
  }) : this._(
         key: key,
         controller: controller,
         type: BasicSwitchType.ios,
         onChanged: onChanged,
         label: label,
         activeIcon: activeIcon,
         inactiveIcon: inactiveIcon,
         activeColor: activeColor,
         inactiveColor: inactiveColor,
         activeBackgroundColor: activeBackgroundColor,
         inactiveBackgroundColor: inactiveBackgroundColor,
       );

  const BasicSwitch.adaptive({
    Key? key,
    BasicSelectionController? controller,
    ValueChanged<bool>? onChanged,
    String? label,
    Icon? activeIcon,
    Icon? inactiveIcon,
    Color? activeColor,
    Color? inactiveColor,
    Color? activeBackgroundColor,
    Color? inactiveBackgroundColor,
  }) : this._(
         key: key,
         controller: controller,
         type: BasicSwitchType.adaptive,
         onChanged: onChanged,
         label: label,
         activeIcon: activeIcon,
         inactiveIcon: inactiveIcon,
         activeColor: activeColor,
         inactiveColor: inactiveColor,
         activeBackgroundColor: activeBackgroundColor,
         inactiveBackgroundColor: inactiveBackgroundColor,
       );

  const BasicSwitch.icon({
    Key? key,
    BasicSelectionController? controller,
    ValueChanged<bool>? onChanged,
    String? label,
    Icon? activeIcon,
    Icon? inactiveIcon,
    Color? activeColor,
    Color? inactiveColor,
    Color? activeBackgroundColor,
    Color? inactiveBackgroundColor,
    double? elevation,
    bool isBackgroundColor = true,
  }) : this._(
         key: key,
         controller: controller,
         type: BasicSwitchType.icon,
         onChanged: onChanged,
         label: label,
         activeIcon: activeIcon,
         inactiveIcon: inactiveIcon,
         activeColor: activeColor,
         inactiveColor: inactiveColor,
         activeBackgroundColor: activeBackgroundColor,
         inactiveBackgroundColor: inactiveBackgroundColor,
         elevation: elevation,
         isBackgroundColor: isBackgroundColor,
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
          final switchWidget = _buildSwitch(context);
          final labelText = widget.label;
          return Semantics(
            label: labelText,
            checked: isSelected,
            enabled: state.isActive,
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
                          color: state.isDisabled
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

  Widget _buildSwitch(BuildContext context) {
    final isSelected = _controller.isSelected;
    final state = _controller.state;
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    switch (widget.type) {
      case BasicSwitchType.android:
        return Switch(
          value: isSelected,
          activeTrackColor: widget.activeBackgroundColor,
          inactiveTrackColor: widget.inactiveBackgroundColor,
          thumbIcon: _getIcon(context, isDarkMode),
          onChanged: state.isActive ? (bool value) => _onChanged() : null,
        );
      case BasicSwitchType.ios:
        return CupertinoSwitch(
          applyTheme: true,
          value: isSelected,
          activeTrackColor: widget.activeBackgroundColor,
          inactiveTrackColor: widget.inactiveBackgroundColor,
          thumbIcon: _getIcon(context, isDarkMode),
          onChanged: state.isActive ? (bool value) => _onChanged() : null,
        );
      case BasicSwitchType.adaptive:
        return Switch.adaptive(
          value: isSelected,
          activeTrackColor: widget.activeBackgroundColor,
          inactiveTrackColor: widget.inactiveBackgroundColor,
          thumbIcon: _getIcon(context, isDarkMode),
          applyCupertinoTheme: true,
          onChanged: state.isActive ? (bool value) => _onChanged() : null,
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
            color: _getColorBackgroundIcon(context, isDarkMode),
          ),
          child: IconButton(
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(),
            splashRadius: 16,
            tooltip: widget.label,
            alignment: Alignment.center,
            iconSize: 28,
            isSelected: isSelected,
            color: _getColorIcon(context, isDarkMode),
            icon: isSelected
                ? widget.activeIcon ??
                      const Icon(Icons.radio_button_checked_rounded)
                : widget.inactiveIcon ??
                      widget.activeIcon ??
                      const Icon(Icons.radio_button_unchecked),
            onPressed: state.isActive ? () => _onChanged() : null,
          ),
        );
    }
  }

  void _onChanged() {
    _controller.toggleSelection();
    widget.onChanged?.call(_controller.isSelected);
  }

  Color _getColorBackgroundIcon(BuildContext context, bool isDarkMode) {
    final isSelected = _controller.isSelected;
    final state = _controller.state;
    if (!widget.isBackgroundColor) {
      return Colors.transparent;
    }
    if (widget.activeBackgroundColor != null && isSelected) {
      return widget.activeBackgroundColor!;
    }

    if (widget.inactiveBackgroundColor != null && !isSelected) {
      return widget.inactiveBackgroundColor!;
    }

    if (state.isDisabled) {
      if (isDarkMode) {
        return Color(0xFF232429); // Disabled color
      }
      return Color(0xFFeeeff4); // Disabled color for light mode
    }

    if (isDarkMode) {
      return isSelected
          ? Theme.of(context).colorScheme.primary
          : Color(0xFF333439); // Inactive color
    }
    return isSelected
        ? Theme.of(context).colorScheme.primary
        : Theme.of(
            context,
          ).colorScheme.onSurface.withValues(alpha: 0.12); // Inactive color
  }

  Color _getColorIcon(BuildContext context, bool isDarkMode) {
    final isSelected = _controller.isSelected;
    final state = _controller.state;
    if (widget.activeColor != null && isSelected) {
      return widget.activeColor!;
    }
    if (widget.inactiveColor != null && !isSelected) {
      return widget.inactiveColor!;
    }

    if (state == BasicSelectionState.disabled) {
      if (isDarkMode) {
        return Colors.white.withValues(alpha: 0.48); // Disabled color
      }
      return Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.38);
    }

    if (!widget.isBackgroundColor) {
      return isSelected
          ? Theme.of(context).colorScheme.primary
          : Colors.white.withValues(alpha: 0.38); // Inactive color
    }

    return Colors.white; // Active color
  }

  WidgetStateProperty<Icon?>? _getIcon(BuildContext context, bool isDarkMode) {
    final isSelected = _controller.isSelected;
    final state = _controller.state;
    return WidgetStateProperty.resolveWith((Set<WidgetState> states) {
      if (isSelected) {
        final activeIconData = widget.activeIcon?.icon;
        if (widget.activeColor != null) {
          return Icon(
            activeIconData,
            color: _getColorIcon(context, isDarkMode),
          );
        }
        return widget.activeIcon;
      }

      if (isSelected == false || state.isDisabled) {
        final inactiveIconData = widget.inactiveIcon?.icon;
        if (widget.inactiveColor != null) {
          return Icon(
            inactiveIconData,
            color: _getColorIcon(context, isDarkMode),
          );
        }
        return widget.inactiveIcon;
      }

      return null;
    });
  }
}
