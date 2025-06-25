import 'package:core/utils/exceptions/validator_exception.dart';
import 'package:core/utils/validators/validators.dart';

final class SignInUsecaseParam {
  final String email;
  final String password;

  SignInUsecaseParam({required this.email, required this.password}) {
    validate();
  }

  @override
  String toString() {
    return 'SignInUsecaseParam(email: $email, password: $password)';
  }

  void validate() {
    if (email.isEmpty) {
      throw ValidatorException(
        fieldName: 'email',
        errMessage: 'Email cannot be empty',
      );
    }
    if (password.isEmpty) {
      throw ValidatorException(
        fieldName: 'password',
        errMessage: 'Password cannot be empty',
      );
    }

    final emailValidation = Validators.validateEmail(email);
    if (emailValidation != null) {
      throw ValidatorException(fieldName: 'email', errMessage: emailValidation);
    }

    final passwordValidation = Validators.validatePassword(password);
    if (passwordValidation != null) {
      throw ValidatorException(
        fieldName: 'password',
        errMessage: passwordValidation,
      );
    }
  }
}
