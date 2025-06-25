import 'package:chucker_flutter/chucker_flutter.dart';
import 'package:core/config/app_config.dart';
import 'package:core/config/app_flavor.dart';
import 'package:cote_network_logger/cote_network_logger.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_blox_template/app/di/injection.dart';
import 'package:shared/utils/simple_observer.dart';

import 'app/my_app.dart';

/// =========================================================
/// Created by Pahnal Aditia
/// GitHub  : https://github.com/fahnaladitia
/// LinkedIn: https://www.linkedin.com/in/pahnaladitia
/// =========================================================

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Running Cote Network Logger
  await startNetworkLogServer();

  // Chucker Flutter
  ChuckerFlutter.showOnRelease =
      kDebugMode; // Show Chucker only in debug mode, if you want to see it in release mode, set to true

  // Initialize AppConfig with the staging configuration
  AppConfig.load(AppFlavor.production);

  // Initialize dependency injection
  await Injection.init();

  Bloc.observer = SimpleBlocObserver(); // Set up a simple Bloc observer

  // Sentry initialization can be added here if needed
  // await SentryService.init(app: () => runApp(const MyApp()));

  runApp(const MyApp());
}
