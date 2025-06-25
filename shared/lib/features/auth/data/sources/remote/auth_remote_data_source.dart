import 'package:core/utils/exceptions/network_exception.dart';

import '../local/entities/auth_entity.dart';
import 'api/auth_service.dart';

import 'dtos/req/refresh_token_request.dart';
import 'dtos/req/sign_in_request.dart';
import 'dtos/req/sign_up_request.dart';

abstract class AuthRemoteDataSource {
  Future<AuthEntity> signIn(SignInRequest request);

  Future<AuthEntity> signUp(SignUpRequest request);

  Future<String> refreshAccessToken(RefreshTokenRequest request);
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final AuthService service;

  AuthRemoteDataSourceImpl({required this.service});

  @override
  Future<String> refreshAccessToken(RefreshTokenRequest request) async {
    final response = await service.refreshAccesToken(request);
    if (response.data?.accessToken == null ||
        response.data?.accessToken?.isEmpty == true) {
      throw NetworkException(
        code: 'REFRESH_TOKEN_ERROR',
        message: 'Failed to refresh access token',
      );
    }
    return response.data?.accessToken ?? '';
  }

  @override
  Future<AuthEntity> signIn(SignInRequest request) async {
    final response = await service.signIn(request);
    return AuthEntity.fromSignInResponse(response);
  }

  @override
  Future<AuthEntity> signUp(SignUpRequest request) async {
    final response = await service.signUp(request);
    return AuthEntity.fromSignUpResponse(response);
  }
}
