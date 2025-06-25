import '../presentation/blocs/sign_in/sign_in_bloc.dart';
import '../presentation/blocs/sign_up/sign_up_bloc.dart';
import 'package:get_it/get_it.dart';

final class AuthModule {
  AuthModule._();

  static final GetIt _getIt = GetIt.instance;

  static Future<void> init() async {
    _blocsInit();
  }

  static void _blocsInit() {
    _getIt.registerFactory(() => SignInBloc(signInUsecase: _getIt()));
    _getIt.registerFactory(() => SignUpBloc(signUpUsecase: _getIt()));
  }
}
