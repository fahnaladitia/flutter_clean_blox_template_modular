part of 'di.dart';

class CoreModule {
  CoreModule._();

  static Future<void> init() async {
    // Initialize core dependencies here
    await AppLogger.init();
    sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl());
    AppLogger.info('CoreModule initialized successfully.');
  }
}
