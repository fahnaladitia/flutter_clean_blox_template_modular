import 'package:core/core.dart';
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

final class AuthModule extends BaseModule {
  @override
  Future<void> registerDependencies() async {
    // Register local data sources for authentication
    sl.registerLazySingleton<AuthLocalDataSource>(
      () => AuthLocalDataSourceImpl(authDatabase: sl()),
    );

    // If you have remote data sources, register them here
    sl.registerLazySingleton<AuthRemoteDataSource>(
      () => AuthRemoteDataSourceImpl(client: sl()),
    );

    // Register repositories for authentication
    sl.registerLazySingleton<AuthRepository>(
      () => AuthRepositoryImpl(localDataSource: sl(), remoteDataSource: sl()),
    );

    // Register use cases for authentication
    sl.registerLazySingleton(() => GetAccessTokenUsecase(repository: sl()));
    sl.registerLazySingleton(() => GetUserIdUsecase(repository: sl()));
    sl.registerLazySingleton(() => RefreshAccessTokenUsecase(repository: sl()));
    sl.registerLazySingleton(() => SignInUsecase(repository: sl()));
    sl.registerLazySingleton(() => SignOutUsecase(repository: sl()));
    sl.registerLazySingleton(() => SignUpUsecase(repository: sl()));

    // Register your authentication blocs here
    sl.registerLazySingleton(
      () => AuthBloc(getAccessTokenUsecase: sl(), signOutUsecase: sl()),
    );
    sl.registerFactory(() => SignInBloc(signInUsecase: sl()));
    sl.registerFactory(() => SignUpBloc(signUpUsecase: sl()));

    AppLogger.info('AuthModule initialized successfully.');
  }
}
