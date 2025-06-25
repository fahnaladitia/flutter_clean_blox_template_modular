import '../models/auth.dart';

abstract class AuthRepository {
  Future<Auth> signIn({required String email, required String password});
  Future<Auth> signUp({
    required String name,
    required String email,
    required String password,
  });
  Future<void> signOut();
  Future<void> saveAuth(Auth auth);
  Future<String?> getRefreshToken();
  Future<String?> getAccessToken();
  Future<String?> getUserId();
  Future<bool> isAuthenticated();
  Future<String> createNewAccessToken(String refreshToken);
  Future<void> updateAccessToken(String accessToken);
}
