import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:application/di/injection.dart';
import 'package:shared/shared.dart';

import 'my_app.dart';

/// =========================================================
/// Created by Pahnal Aditia
/// GitHub  : https://github.com/fahnaladitia
/// LinkedIn: https://www.linkedin.com/in/pahnaladitia
/// =========================================================

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize AppConfig with the staging configuration
  AppConfig.load(AppFlavor.staging);

  // Running Cote Network Logger
  await CoteNetworkServerUtils.startServer();

  // Chucker Flutter
  ChuckerFlutterUtils.init();

  // Initialize dependency injection
  await Injection.init();

  BlocUtils.runSimpleBlocObserver();

  // Sentry initialization can be added here if needed
  // await SentryService.init(app: () => runApp(const MyApp()));

  runApp(MyApp());
}
