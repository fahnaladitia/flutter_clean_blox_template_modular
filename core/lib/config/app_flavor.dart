enum AppFlavor { staging, production }

extension AppFlavorExtension on AppFlavor {
  String get name => toString().split('.').last;
}
