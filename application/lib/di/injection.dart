import 'package:application/di/app_module.dart';
import 'package:core/utils/log/app_logger.dart';
import 'package:feature_auth/di/auth_module.dart';

import 'package:get_it/get_it.dart';

/// =========================================================
/// Created by Pahnal Aditia
/// GitHub  : https://github.com/fahnaladitia
/// LinkedIn: https://www.linkedin.com/in/pahnaladitia
/// =========================================================

final getIt = GetIt.instance;

class Injection {
  Injection._();

  static Future<void> init() async {
    await AppLogger.init();
    AppLogger.info('Initializing Dependency Injection...');
    await AppModule.init();
    AppLogger.info('AppModule initialized successfully.');
    await AuthModule.init();
    AppLogger.info('AuthModule initialized successfully.');
  }
}
