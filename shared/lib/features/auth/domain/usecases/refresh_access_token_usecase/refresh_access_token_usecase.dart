import 'package:core/utils/exceptions/base_exception.dart';
import 'package:core/utils/usecases/usecases.dart';
import '../../repositories/auth_repository.dart';

final class RefreshAccessTokenUsecase implements Usecase<void> {
  final AuthRepository repository;

  RefreshAccessTokenUsecase({required this.repository});
  @override
  Future<void> call() async {
    // Checking if the user is authenticated
    // If the user is authenticated, we retrieve the access token
    final isAuthenticated = await repository.isAuthenticated();
    if (!isAuthenticated) {
      // If the user is not authenticated, we throw an exception
      throw BaseException(
        code: 'NOT_AUTHENTICATED',
        message: 'User is not authenticated. Please sign in first.',
      );
    }
    // If the user is authenticated, we proceed to refresh the access token
    final refreshToken = await repository.getRefreshToken();
    if (refreshToken == null) {
      // If the refresh token is null, we throw an exception
      throw BaseException(
        code: 'NO_REFRESH_TOKEN',
        message: 'No refresh token found. Please sign in again.',
      );
    }
    // Refreshing the access token using the refresh token
    final newAccessToken = await repository.createNewAccessToken(refreshToken);

    // Updating the access token in the repository
    await repository.updateAccessToken(newAccessToken);
  }
}
