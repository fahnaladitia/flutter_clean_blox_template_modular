import 'package:core/utils/usecases/usecases.dart';

import '../../repositories/auth_repository.dart';

final class GetAccessTokenUsecase implements Usecase<String?> {
  final AuthRepository repository;

  GetAccessTokenUsecase({required this.repository});
  @override
  Future<String?> call() async {
    // Checking if the user is authenticated
    // If the user is authenticated, we retrieve the access token
    final isAuthenticated = await repository.isAuthenticated();
    if (isAuthenticated) {
      return await repository.getAccessToken();
    }
    // If the user is not authenticated, we return null
    return null;
  }
}
