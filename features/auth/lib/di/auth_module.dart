import 'package:feature_auth/data/repositories/auth_repository.dart';
import 'package:feature_auth/data/sources/local/auth_local_data_source.dart';
import 'package:feature_auth/data/sources/remote/auth_remote_data_source.dart';
import 'package:feature_auth/domain/repositories/auth_repository.dart';
import 'package:feature_auth/domain/usecases/get_access_token_usecase/get_access_token_usecase.dart';
import 'package:feature_auth/domain/usecases/get_user_id_usecase/get_user_id_usecase.dart';
import 'package:feature_auth/domain/usecases/refresh_access_token_usecase/refresh_access_token_usecase.dart';
import 'package:feature_auth/domain/usecases/sign_in_usecase/sign_in_usecase.dart';
import 'package:feature_auth/domain/usecases/sign_out_usecase/sign_out_usecase.dart';
import 'package:feature_auth/domain/usecases/sign_up_usecase/sign_up_usecase.dart';
import 'package:feature_auth/presentation/blocs/auth/auth_bloc.dart';
import 'package:feature_auth/presentation/blocs/sign_in/sign_in_bloc.dart';
import 'package:feature_auth/presentation/blocs/sign_up/sign_up_bloc.dart';

import 'package:get_it/get_it.dart';

final class AuthModule {
  AuthModule._();
  static final GetIt _getIt = GetIt.instance;

  static Future<void> init() async {
    // Register local data sources for authentication
    _getIt.registerLazySingleton<AuthLocalDataSource>(
      () => AuthLocalDataSourceImpl(authDatabase: _getIt()),
    );

    // If you have remote data sources, register them here
    _getIt.registerLazySingleton<AuthRemoteDataSource>(
      () => AuthRemoteDataSourceImpl(client: _getIt()),
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
    _getIt.registerFactory(() => SignInBloc(signInUsecase: _getIt()));
    _getIt.registerFactory(() => SignUpBloc(signUpUsecase: _getIt()));
  }
}
