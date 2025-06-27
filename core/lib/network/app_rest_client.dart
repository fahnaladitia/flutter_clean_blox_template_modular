part of 'network.dart';

/// =========================================================
/// Created by Pahnal Aditia
/// GitHub  : https://github.com/fahnaladitia
/// LinkedIn: https://www.linkedin.com/in/pahnaladitia
/// =========================================================

abstract class AppRestClient {
  Future<Response<T>> get<T>(
    String path, {
    Map<String, dynamic>? queryParameters,
    Options? options,
  });

  Future<Response<T>> post<T>(
    String path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  });

  Future<Response<T>> put<T>(
    String path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  });

  Future<Response<T>> delete<T>(
    String path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  });

  Future<Response<T>> patch<T>(
    String path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  });
}

class AppRestClientImpl implements AppRestClient {
  final Dio dio;
  final NetworkInfo networkInfo;
  final AuthDatabase authDatabase;

  AppRestClientImpl._({
    required this.dio,
    required this.networkInfo,
    required this.authDatabase,
  });

  factory AppRestClientImpl.create({
    required String baseURL,
    required String apiKey,
    required NetworkInfo networkInfo,
    required AuthDatabase authDatabase,
  }) {
    final dio = Dio();

    _configureDio(dio, baseURL: baseURL, apiKey: apiKey);

    dio.interceptors.add(ErrorInterceptor());
    dio.interceptors.add(TokenInterceptor(authDatabase: authDatabase));
    dio.interceptors.add(NetworkInfoInterceptor(networkInfo: networkInfo));

    final isStaging = AppConfig.flavor == AppFlavor.staging;

    dio.interceptors.add(CoteNetworkLogger());
    dio.interceptors.add(ChuckerDioInterceptor());

    if (isStaging || kDebugMode) {
      dio.interceptors.add(
        PrettyDioLogger(
          requestHeader: true,
          requestBody: true,
          responseHeader: false,
          responseBody: true,
          error: true,
          compact: true,
          maxWidth: 90,
        ),
      );
    }

    return AppRestClientImpl._(
      dio: dio,
      networkInfo: networkInfo,
      authDatabase: authDatabase,
    );
  }

  static void _configureDio(
    Dio dio, {
    required String baseURL,
    required String apiKey,
  }) {
    // Configure Dio with base options
    final baseOptions = BaseOptions();

    // Set the base URL for the Dio instance
    baseOptions.baseUrl = baseURL;

    // Headers can be set here if needed
    baseOptions.headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      // TODO: Replace with your actual API key
      'x-api-key': apiKey,
    };

    baseOptions.contentType = Headers.jsonContentType;

    dio.options = baseOptions;
  }

  @override
  Future<Response<T>> get<T>(
    String path, {
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) {
    // Ensure that the path starts with a slash
    final formattedPath = path.startsWith('/') ? path : '/$path';

    // Use the Dio instance to make a GET request
    return dio.get<T>(
      formattedPath,
      queryParameters: queryParameters,
      options: options,
    );
  }

  @override
  Future<Response<T>> post<T>(
    String path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) {
    // Ensure that the path starts with a slash
    final formattedPath = path.startsWith('/') ? path : '/$path';

    // Use the Dio instance to make a POST request
    return dio.post<T>(
      formattedPath,
      data: data,
      queryParameters: queryParameters,
      options: options,
    );
  }

  @override
  Future<Response<T>> put<T>(
    String path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) {
    // Ensure that the path starts with a slash
    final formattedPath = path.startsWith('/') ? path : '/$path';

    // Use the Dio instance to make a PUT request
    return dio.put<T>(
      formattedPath,
      data: data,
      queryParameters: queryParameters,
      options: options,
    );
  }

  @override
  Future<Response<T>> delete<T>(
    String path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) {
    // Ensure that the path starts with a slash
    final formattedPath = path.startsWith('/') ? path : '/$path';

    // Use the Dio instance to make a DELETE request
    return dio.delete<T>(
      formattedPath,
      data: data,
      queryParameters: queryParameters,
      options: options,
    );
  }

  @override
  Future<Response<T>> patch<T>(
    String path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) {
    // Ensure that the path starts with a slash
    final formattedPath = path.startsWith('/') ? path : '/$path';

    // Use the Dio instance to make a PATCH request
    return dio.patch<T>(
      formattedPath,
      data: data,
      queryParameters: queryParameters,
      options: options,
    );
  }
}
