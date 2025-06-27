import 'package:core/core.dart';

class AppModule {
  AppModule._();

  static Future<void> init() async {
    sl.registerLazySingleton<AuthDatabase>(() => AuthDatabaseImpl());

    sl.registerLazySingleton<AppRestClient>(() {
      final client = AppRestClientImpl.create(
        baseURL: AppConfig.config.baseURL,
        apiKey: AppConfig.config.apiKey,
      );

      client.addInterceptors([
        ErrorInterceptor(),
        CoteNetworkServerUtils.interceptor,
        ChuckerFlutterUtils.interceptor,
        TokenInterceptor(authDatabase: sl<AuthDatabase>()),
        NetworkInfoInterceptor(networkInfo: sl<NetworkInfo>()),
      ]);

      return client;
    });

    AppLogger.info('AppModule initialized successfully.');
  }
}
