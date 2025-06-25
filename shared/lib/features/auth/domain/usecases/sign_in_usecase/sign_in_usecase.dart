import 'package:core/utils/exceptions/base_exception.dart';
import 'package:core/utils/usecases/usecases.dart';
import '../../repositories/auth_repository.dart';

import 'sign_in_usecase_param.dart';

final class SignInUsecase
    implements UsecaseWithParam<void, SignInUsecaseParam> {
  final AuthRepository repository;

  SignInUsecase({required this.repository});
  @override
  Future<void> call(SignInUsecaseParam param) async {
    // Checking if the user is authenticated
    // If the user is authenticated, we retrieve the access token
    final isAuthenticated = await repository.isAuthenticated();
    if (isAuthenticated) {
      // Authenticated users should not be able to sign in again
      throw BaseException(
        code: 'ALREADY_AUTHENTICATED',
        message: 'User is already authenticated. Please sign out first.',
      );
    }

    // If the user is not authenticated, we proceed with the sign-in process
    final result = await repository.signIn(
      email: param.email,
      password: param.password,
    );

    // Saving the authentication data
    await repository.saveAuth(result);
  }
}
