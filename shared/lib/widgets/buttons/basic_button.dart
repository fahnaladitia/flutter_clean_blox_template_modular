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
        onPressed: state == BasicButtonEventState.active ? onPressed : null,
        icon: icon!,
        label: Text(text),
      );
    }

    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        minimumSize: isFullWidth
            ? Size(double.infinity, size.height)
            : Size(size.width, size.height),
      ),
      onPressed: state == BasicButtonEventState.active ? onPressed : null,
      child: Text(text),
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
        onPressed: state == BasicButtonEventState.active ? onPressed : null,
        icon: icon!,
        label: Text(text),
      );
    }

    return FilledButton(
      style: FilledButton.styleFrom(
        minimumSize: isFullWidth
            ? Size(double.infinity, size.height)
            : Size(size.width, size.height),
      ),
      onPressed: state == BasicButtonEventState.active ? onPressed : null,
      child: Text(text),
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
        onPressed: state == BasicButtonEventState.active ? onPressed : null,
        icon: icon!,
        label: Text(text),
      );
    }

    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        minimumSize: isFullWidth
            ? Size(double.infinity, size.height)
            : Size(size.width, size.height),
      ),
      onPressed: state == BasicButtonEventState.active ? onPressed : null,
      child: Text(text),
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
        onPressed: state == BasicButtonEventState.active ? onPressed : null,
        icon: icon!,
        label: Text(text),
      );
    }

    return TextButton(
      style: TextButton.styleFrom(
        minimumSize: isFullWidth
            ? Size(double.infinity, size.height)
            : Size(size.width, size.height),
      ),
      onPressed: state == BasicButtonEventState.active ? onPressed : null,
      child: Text(text),
    );
  }
}

// class BasicButton extends StatelessWidget {
//   final String text;
//   final void Function()? onPressed;
//   final Color fillColor;
//   final Color textColor;
//   final Color? sideColor;
//   final double? width;
//   final Widget? icon;
//   final TextStyle? textStyle;
//   final BasicButtonEventState state;

//   const BasicButton._({
//     super.key,
//     required this.text,
//     this.onPressed,
//     required this.fillColor,
//     required this.textColor,
//     this.sideColor,
//     this.width,
//     this.icon,
//     this.textStyle,
//     this.state = BasicButtonEventState.active,
//   });

//   /// Primary button preset
//   const BasicButton.primary({
//     Key? key,
//     required String text,
//     void Function()? onPressed,
//     double? width,
//     Widget? icon,
//     TextStyle? textStyle,
//     BasicButtonEventState state = BasicButtonEventState.active,
//     Color? fillColor,
//   }) : this._(
//          key: key,
//          text: text,
//          onPressed: onPressed,
//          fillColor: fillColor ?? const Color(0xFF1FA0C9),
//          textColor: Colors.white,
//          width: width,
//          icon: icon,
//          textStyle: textStyle,
//          state: state,
//        );

//   /// Secondary button preset
//   const BasicButton.secondary({
//     Key? key,
//     required String text,
//     void Function()? onPressed,
//     double? width,
//     Widget? icon,
//     TextStyle? textStyle,
//     BasicButtonEventState state = BasicButtonEventState.active,
//   }) : this._(
//          key: key,
//          text: text,
//          onPressed: onPressed,
//          fillColor: Colors.white,
//          textColor: const Color(0xFF1FA0C9),
//          sideColor: const Color(0xFF1FA0C9),
//          width: width,
//          icon: icon,
//          textStyle: textStyle,
//          state: state,
//        );

//   bool get _isEnabled => state == BasicButtonEventState.active;
//   bool get _isLoading => state == BasicButtonEventState.loading;

//   @override
//   Widget build(BuildContext context) {
//     final style = FilledButton.styleFrom(
//       backgroundColor: fillColor,
//       foregroundColor: textColor,
//       textStyle: textStyle ?? AppTextStyle.buttonText,
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(4),
//         side: sideColor != null
//             ? BorderSide(color: sideColor!)
//             : BorderSide.none,
//       ),
//       elevation: 0,
//       alignment: Alignment.center,
//     );

//     final child = _isLoading
//         ? const SizedBox(
//             width: 20,
//             height: 20,
//             child: CircularProgressIndicator(
//               strokeWidth: 2,
//               color: Colors.white,
//             ),
//           )
//         : Text(text);

//     return SizedBox(
//       width: width,
//       height: 43,
//       child: icon != null && !_isLoading
//           ? FilledButton.icon(
//               onPressed: _isEnabled ? onPressed : null,
//               style: style,
//               icon: icon!,
//               label: child,
//             )
//           : FilledButton(
//               onPressed: _isEnabled ? onPressed : null,
//               style: style,
//               child: child,
//             ),
//     );
//   }
// }
