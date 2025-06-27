import 'package:core/core.dart';
import 'package:equatable/equatable.dart';
import 'package:shared/shared.dart';

final class SignUpUsecaseParam extends Equatable {
  final String email;
  final String password;
  final String confirmPassword;
  final String name;

  const SignUpUsecaseParam({
    required this.email,
    required this.password,
    required this.confirmPassword,
    required this.name,
  });

  @override
  List<Object> get props => [email, password, confirmPassword, name];

  @override
  String toString() {
    return 'SignUpUsecaseParam(email: $email, password: $password, confirmPassword: $confirmPassword, name: $name)';
  }

  void validate() {
    // Check if name is not empty
    if (name.isEmpty) {
      throw ValidatorException(
        fieldName: 'name',
        errMessage: 'Name cannot be empty',
      );
    }

    // Check if email, password, and confirmPassword are not empty
    if (email.isEmpty) {
      throw ValidatorException(
        fieldName: 'email',
        errMessage: 'Email cannot be empty',
      );
    }

    // Check if password and confirmPassword are not empty
    if (password.isEmpty) {
      throw ValidatorException(
        fieldName: 'password',
        errMessage: 'Password cannot be empty',
      );
    }

    // Validate email
    final emailValidation = ValidatorUtils.validateEmail(email);
    if (emailValidation != null) {
      throw ValidatorException(fieldName: 'email', errMessage: emailValidation);
    }

    // Validate password
    final passwordValidation = ValidatorUtils.validatePassword(password);
    if (passwordValidation != null) {
      throw ValidatorException(
        fieldName: 'password',
        errMessage: passwordValidation,
      );
    }

    // Validate confirmPassword
    final confirmPasswordValidation =
        ValidatorUtils.validatePasswordConfirmation(password, confirmPassword);
    if (confirmPasswordValidation != null) {
      throw ValidatorException(
        fieldName: 'confirm_password',
        errMessage: confirmPasswordValidation,
      );
    }
  }
}
