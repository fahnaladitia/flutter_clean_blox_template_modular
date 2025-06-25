import 'package:core/network/app_rest_client.dart';

import '../dtos/req/refresh_token_request.dart';
import '../dtos/req/sign_in_request.dart';
import '../dtos/req/sign_up_request.dart';
import '../dtos/res/refresh_token_response.dart';
import '../dtos/res/sign_in_response.dart';
import '../dtos/res/sign_up_response.dart';

abstract class AuthService {
  Future<SignInResponse> signIn(SignInRequest request);

  Future<SignUpResponse> signUp(SignUpRequest request);

  Future<RefreshTokenResponse> refreshAccesToken(RefreshTokenRequest request);
}

class AuthServiceImpl implements AuthService {
  final AppRestClient client;

  AuthServiceImpl({required this.client});

  @override
  Future<SignInResponse> signIn(SignInRequest request) async {
    final response = await client.post('/sign-in', data: request.toJson());
    return SignInResponse.fromJson(response.data);
  }

  @override
  Future<SignUpResponse> signUp(SignUpRequest request) async {
    final response = await client.post('/sign-up', data: request.toJson());
    return SignUpResponse.fromJson(response.data);
  }

  @override
  Future<RefreshTokenResponse> refreshAccesToken(
    RefreshTokenRequest request,
  ) async {
    final response = await client.post(
      '/refresh-token',
      data: request.toJson(),
    );
    return RefreshTokenResponse.fromJson(response.data);
  }
}
