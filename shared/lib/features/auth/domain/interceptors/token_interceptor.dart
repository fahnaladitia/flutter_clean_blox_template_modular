import 'package:dio/dio.dart';
import '../usecases/get_access_token_usecase/get_access_token_usecase.dart';

/// =========================================================
/// Created by Pahnal Aditia
/// GitHub  : https://github.com/fahnaladitia
/// LinkedIn: https://www.linkedin.com/in/pahnaladitia
/// =========================================================

class TokenInterceptor extends InterceptorsWrapper {
  final GetAccessTokenUsecase getAccessTokenUsecase;

  TokenInterceptor({
    super.onRequest,
    super.onResponse,
    super.onError,
    required this.getAccessTokenUsecase,
  });
  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final accessToken = await getAccessTokenUsecase();

    if (accessToken == null) {
      // If no token is found, proceed without modifying the request
      return super.onRequest(options, handler);
    }

    options.headers['Authorization'] = 'Bearer $accessToken';
    super.onRequest(options, handler);
  }
}
