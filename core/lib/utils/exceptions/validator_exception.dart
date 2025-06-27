part of '../utils.dart';

class ValidatorException extends BaseException {
  final String fieldName;
  final String errMessage;

  const ValidatorException({required this.fieldName, required this.errMessage})
    : super(
        code: 'VALIDATION_ERROR',
        message: 'Validation error on $fieldName: $errMessage',
      );

  @override
  String toString() {
    return 'ValidatorException: [$fieldName], Error: $errMessage)';
  }
}
