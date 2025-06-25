import 'package:connectivity_plus/connectivity_plus.dart';
import '../network/network_info.dart';
import 'package:get_it/get_it.dart';

/// =========================================================
/// Created by Pahnal Aditia
/// GitHub  : https://github.com/fahnaladitia
/// LinkedIn: https://www.linkedin.com/in/pahnaladitia
/// =========================================================

class CoreModule {
  CoreModule._();

  static final _getIt = GetIt.instance;

  static Future<void> init() async {
    _getIt.registerLazySingleton<NetworkInfo>(
      () => NetworkInfoImpl(Connectivity()),
    );
  }
}
