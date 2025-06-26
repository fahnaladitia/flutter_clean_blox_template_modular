import 'package:core/config/app_config.dart';
import 'package:core/local/auth_database.dart';
import 'package:core/network/app_rest_client.dart';
import 'package:core/network/network_info.dart';
import 'package:get_it/get_it.dart';

class AppModule {
  AppModule._();

  static final GetIt _getIt = GetIt.instance;

  static Future<void> init() async {
    _getIt.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl());
    _getIt.registerLazySingleton<AuthDatabase>(() => AuthDatabaseImpl());

    final client = AppRestClientImpl.create(
      baseURL: AppConfig.config.baseURL,
      apiKey: AppConfig.config.apiKey,
      networkInfo: _getIt(),
      authDatabase: _getIt(),
    );
    _getIt.registerLazySingleton<AppRestClient>(() => client);
  }
}
