import 'package:core/core.dart';

class AppModule {
  AppModule._();

  static Future<void> init() async {
    sl.registerLazySingleton<AuthDatabase>(() => AuthDatabaseImpl());

    final client = AppRestClientImpl.create(
      baseURL: AppConfig.config.baseURL,
      apiKey: AppConfig.config.apiKey,
      networkInfo: sl(),
      authDatabase: sl(),
    );
    sl.registerLazySingleton<AppRestClient>(() => client);

    AppLogger.info('AppModule initialized successfully.');
  }
}
