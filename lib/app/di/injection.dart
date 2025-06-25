import 'package:core/di/core_module.dart';
import 'package:core/utils/log/app_logger.dart';
import 'package:feature_auth/di/auth_module.dart';

import 'package:get_it/get_it.dart';
import 'package:shared/di/shared_module.dart';

/// =========================================================
/// Created by Pahnal Aditia
/// GitHub  : https://github.com/fahnaladitia
/// LinkedIn: https://www.linkedin.com/in/pahnaladitia
/// =========================================================

final getIt = GetIt.instance;

class Injection {
  Injection._();

  static Future<void> init() async {
    initRootLogger();
    await CoreModule.init();
    await SharedModule.init();
    await AuthModule.init();
  }
}
