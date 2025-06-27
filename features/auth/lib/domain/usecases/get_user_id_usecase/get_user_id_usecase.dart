import 'package:core/core.dart';
import 'package:feature_auth/domain/repositories/auth_repository.dart';

class GetUserIdUsecase implements Usecase<String?> {
  final AuthRepository repository;

  GetUserIdUsecase({required this.repository});
  @override
  Future<String?> call() async {
    // Checking if the user is authenticated
    // If the user is authenticated, we retrieve the user ID
    final isAuthenticated = await repository.isAuthenticated();
    if (isAuthenticated) {
      return await repository.getUserId();
    }
    // If the user is not authenticated, we return null
    return null;
  }
}
