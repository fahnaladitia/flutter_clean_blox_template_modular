part of '../widgets.dart';

/// =========================================================
/// Created by Pahnal Aditia
/// GitHub  : https://github.com/fahnaladitia
/// LinkedIn: https://www.linkedin.com/in/pahnaladitia
/// =========================================================

class BasicButton extends StatelessWidget {
  final String text;
  final void Function() onPressed;
  final BasicButtonEventState state;
  final BasicButtonType type;
  final BasicButtonSize size;
  final Widget? icon;
  final bool isFullWidth;
  const BasicButton._({
    super.key,
    required this.text,
    required this.onPressed,
    this.icon,
    this.state = BasicButtonEventState.active,
    this.type = BasicButtonType.elevated,
    this.size = BasicButtonSize.medium,
    this.isFullWidth = false,
  });

  // Elevated button preset
  const BasicButton.elevated({
    Key? key,
    required String text,
    required void Function() onPressed,
    Widget? icon,
    BasicButtonEventState state = BasicButtonEventState.active,
    BasicButtonSize size = BasicButtonSize.medium,
    bool isFullWidth = false,
  }) : this._(
         key: key,
         text: text,
         onPressed: onPressed,
         icon: icon,
         state: state,
         size: size,
         isFullWidth: isFullWidth,
         type: BasicButtonType.elevated,
       );

  // Fill button preset
  const BasicButton.filled({
    Key? key,
    required String text,
    required void Function() onPressed,
    Widget? icon,
    BasicButtonEventState state = BasicButtonEventState.active,
    BasicButtonSize size = BasicButtonSize.medium,
    bool isFullWidth = false,
  }) : this._(
         key: key,
         text: text,
         onPressed: onPressed,
         icon: icon,
         state: state,
         size: size,
         isFullWidth: isFullWidth,
         type: BasicButtonType.filled,
       );

  // Outlined button preset
  const BasicButton.outlined({
    Key? key,
    required String text,
    required void Function() onPressed,
    Widget? icon,
    BasicButtonEventState state = BasicButtonEventState.active,
    BasicButtonSize size = BasicButtonSize.medium,
    bool isFullWidth = false,
  }) : this._(
         key: key,
         text: text,
         onPressed: onPressed,
         icon: icon,
         state: state,
         size: size,
         isFullWidth: isFullWidth,
         type: BasicButtonType.outlined,
       );

  // Text button preset
  const BasicButton.text({
    Key? key,
    required String text,
    required void Function() onPressed,
    Widget? icon,
    BasicButtonEventState state = BasicButtonEventState.active,
    BasicButtonSize size = BasicButtonSize.medium,
    bool isFullWidth = false,
  }) : this._(
         key: key,
         text: text,
         onPressed: onPressed,
         icon: icon,
         state: state,
         size: size,
         isFullWidth: isFullWidth,
         type: BasicButtonType.text,
       );

  @override
  Widget build(BuildContext context) {
    switch (type) {
      case BasicButtonType.elevated:
        return _buildElevatedButton(context);
      case BasicButtonType.filled:
        return _buildFilledButton(context);
      case BasicButtonType.outlined:
        return _buildOutlinedButton(context);
      case BasicButtonType.text:
        return _buildTextButton(context);
    }
  }

  Widget _buildElevatedButton(BuildContext context) {
    final bool isIcon = icon != null;

    if (isIcon) {
      return ElevatedButton.icon(
        style: ElevatedButton.styleFrom(
          minimumSize: isFullWidth
              ? Size(double.infinity, size.height)
              : Size(size.width, size.height),
        ),
        onPressed: state.isActive ? onPressed : null,
        icon: icon!,
        label: state.isLoading ? const CircularProgressIndicator() : Text(text),
      );
    }

    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        minimumSize: isFullWidth
            ? Size(double.infinity, size.height)
            : Size(size.width, size.height),
      ),
      onPressed: state.isActive ? onPressed : null,
      child: state.isLoading ? const CircularProgressIndicator() : Text(text),
    );
  }

  Widget _buildFilledButton(BuildContext context) {
    final bool isIcon = icon != null;
    final bool isFullWidth = this.isFullWidth;
    if (isIcon) {
      return FilledButton.icon(
        style: FilledButton.styleFrom(
          minimumSize: isFullWidth
              ? Size(double.infinity, size.height)
              : Size(size.width, size.height),
        ),
        onPressed: state.isActive ? onPressed : null,
        icon: icon!,
        label: state.isLoading ? const CircularProgressIndicator() : Text(text),
      );
    }

    return FilledButton(
      style: FilledButton.styleFrom(
        minimumSize: isFullWidth
            ? Size(double.infinity, size.height)
            : Size(size.width, size.height),
      ),
      onPressed: state.isActive ? onPressed : null,
      child: state.isLoading ? const CircularProgressIndicator() : Text(text),
    );
  }

  Widget _buildOutlinedButton(BuildContext context) {
    final bool isIcon = icon != null;
    if (isIcon) {
      return OutlinedButton.icon(
        style: OutlinedButton.styleFrom(
          minimumSize: isFullWidth
              ? Size(double.infinity, size.height)
              : Size(size.width, size.height),
        ),
        onPressed: state.isActive ? onPressed : null,
        icon: icon!,
        label: state.isLoading ? const CircularProgressIndicator() : Text(text),
      );
    }

    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        minimumSize: isFullWidth
            ? Size(double.infinity, size.height)
            : Size(size.width, size.height),
      ),
      onPressed: state.isActive ? onPressed : null,
      child: state.isLoading ? const CircularProgressIndicator() : Text(text),
    );
  }

  Widget _buildTextButton(BuildContext context) {
    final bool isIcon = icon != null;
    if (isIcon) {
      return TextButton.icon(
        style: TextButton.styleFrom(
          minimumSize: isFullWidth
              ? Size(double.infinity, size.height)
              : Size(size.width, size.height),
        ),
        onPressed: state.isActive ? onPressed : null,
        icon: icon!,
        label: state.isLoading ? const CircularProgressIndicator() : Text(text),
      );
    }

    return TextButton(
      style: TextButton.styleFrom(
        minimumSize: isFullWidth
            ? Size(double.infinity, size.height)
            : Size(size.width, size.height),
      ),
      onPressed: state.isActive ? onPressed : null,
      child: state.isLoading ? const CircularProgressIndicator() : Text(text),
    );
  }
}
