import 'package:core/config/app_config.dart';
import 'package:core/network/app_rest_client.dart';

import 'package:get_it/get_it.dart';
import 'package:shared/blocs/auth/auth_bloc.dart';
import 'package:shared/features/auth/data/repositories/auth_repository.dart';
import 'package:shared/features/auth/data/sources/local/auth_local_data_source.dart';
import 'package:shared/features/auth/data/sources/local/databases/auth_database.dart';
import 'package:shared/features/auth/data/sources/remote/api/auth_service.dart';
import 'package:shared/features/auth/data/sources/remote/auth_remote_data_source.dart';
import 'package:shared/features/auth/domain/repositories/auth_repository.dart';
import 'package:shared/features/auth/domain/usecases/get_access_token_usecase/get_access_token_usecase.dart';
import 'package:shared/features/auth/domain/usecases/get_user_id_usecase/get_user_id_usecase.dart';
import 'package:shared/features/auth/domain/usecases/refresh_access_token_usecase/refresh_access_token_usecase.dart';
import 'package:shared/features/auth/domain/usecases/sign_in_usecase/sign_in_usecase.dart';
import 'package:shared/features/auth/domain/usecases/sign_out_usecase/sign_out_usecase.dart';
import 'package:shared/features/auth/domain/usecases/sign_up_usecase/sign_up_usecase.dart';

final class SharedAuthModule {
  SharedAuthModule._();
  static final GetIt _getIt = GetIt.instance;

  static Future<void> init() async {
    _getIt.registerLazySingleton<AuthDatabase>(() => AuthDatabaseImpl());

    final client = AppRestClientImpl.create(
      baseURL: "${AppConfig.config.baseURL}/v1/auth",
      apiKey: AppConfig.config.apiKey,
      networkInfo: _getIt(),
    );
    _getIt.registerLazySingleton<AppRestClient>(() => client);

    // Initialize any network services relat
    _getIt.registerLazySingleton<AuthService>(
      () => AuthServiceImpl(client: _getIt()),
    );

    // Register local data sources for authentication
    _getIt.registerLazySingleton<AuthLocalDataSource>(
      () => AuthLocalDataSourceImpl(authDatabase: _getIt()),
    );

    // If you have remote data sources, register them here
    _getIt.registerLazySingleton<AuthRemoteDataSource>(
      () => AuthRemoteDataSourceImpl(service: _getIt()),
    );

    // Register repositories for authentication
    _getIt.registerLazySingleton<AuthRepository>(
      () => AuthRepositoryImpl(
        localDataSource: _getIt(),
        remoteDataSource: _getIt(),
      ),
    );

    // Register use cases for authentication
    _getIt.registerLazySingleton(
      () => GetAccessTokenUsecase(repository: _getIt()),
    );
    _getIt.registerLazySingleton(() => GetUserIdUsecase(repository: _getIt()));
    _getIt.registerLazySingleton(
      () => RefreshAccessTokenUsecase(repository: _getIt()),
    );
    _getIt.registerLazySingleton(() => SignInUsecase(repository: _getIt()));
    _getIt.registerLazySingleton(() => SignOutUsecase(repository: _getIt()));
    _getIt.registerLazySingleton(() => SignUpUsecase(repository: _getIt()));

    // Register your authentication blocs here
    _getIt.registerLazySingleton(
      () => AuthBloc(getAccessTokenUsecase: _getIt(), signOutUsecase: _getIt()),
    );
  }
}
