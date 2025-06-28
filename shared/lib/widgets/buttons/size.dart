part of '../widgets.dart';

enum BasicButtonSize { small, medium, large }

extension BasicButtonSizeExtension on BasicButtonSize {
  double get height {
    switch (this) {
      case BasicButtonSize.small:
        return 48.0;
      case BasicButtonSize.medium:
        return 56.0;
      case BasicButtonSize.large:
        return 64.0;
    }
  }

  double get width {
    switch (this) {
      case BasicButtonSize.small:
        return 64.0;
      case BasicButtonSize.medium:
        return 80.0;
      case BasicButtonSize.large:
        return 96.0;
    }
  }
}
