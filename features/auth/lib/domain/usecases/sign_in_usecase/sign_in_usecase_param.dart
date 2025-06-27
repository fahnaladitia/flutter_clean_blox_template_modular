import 'package:core/core.dart';
import 'package:equatable/equatable.dart';
import 'package:shared/shared.dart';

final class SignInUsecaseParam extends Equatable {
  final String email;
  final String password;

  const SignInUsecaseParam({required this.email, required this.password});

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

    final emailValidation = ValidatorUtils.validateEmail(email);
    if (emailValidation != null) {
      throw ValidatorException(fieldName: 'email', errMessage: emailValidation);
    }

    final passwordValidation = ValidatorUtils.validatePassword(password);
    if (passwordValidation != null) {
      throw ValidatorException(
        fieldName: 'password',
        errMessage: passwordValidation,
      );
    }
  }

  @override
  List<Object> get props => [email, password];
}
