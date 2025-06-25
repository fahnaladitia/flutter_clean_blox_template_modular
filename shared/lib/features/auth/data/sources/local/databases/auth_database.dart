import 'package:core/utils/exceptions/cache_exception.dart';
import 'package:core/utils/log/app_logger.dart';

import '../entities/auth_entity.dart';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';

/// =========================================================
/// Created by Pahnal Aditia
/// GitHub  : https://github.com/fahnaladitia
/// LinkedIn: https://www.linkedin.com/in/pahnaladitia
/// =========================================================

abstract class AuthDatabase {
  Future<void> saveAuth(AuthEntity entity);
  Future<String?> getAccessToken();
  Future<String?> getRefreshToken();
  Future<String?> getUserId();
  Future<bool> isAuthenticated();
  Future<void> clear();
  Future<void> updateAccessToken(String accessToken);
}

class AuthDatabaseImpl implements AuthDatabase {
  final FlutterSecureStorage _storage;
  AuthDatabaseImpl([FlutterSecureStorage? storage])
    : _storage =
          storage ??
          FlutterSecureStorage(
            aOptions: AndroidOptions.defaultOptions.copyWith(
              encryptedSharedPreferences: true,
            ),
          );

  static const String _userIdKey = 'user_id';
  static const String _accessToken = 'access_token';
  static const String _refreshToken = 'refresh_token';

  @override
  Future<void> clear() async {
    try {
      await _storage.deleteAll();
    } catch (e, s) {
      AppLogger.error('Failed to clear auth data', e, s);
      throw CacheException(cause: 'Failed to clear auth data');
    }
  }

  @override
  Future<String?> getRefreshToken() async {
    try {
      return await _storage.read(key: _refreshToken);
    } catch (e, s) {
      AppLogger.error('Failed to get refresh token', e, s);
      throw CacheException(cause: 'Failed to get refresh token');
    }
  }

  @override
  Future<String?> getAccessToken() async {
    try {
      return await _storage.read(key: _accessToken);
    } catch (e, s) {
      AppLogger.error('Failed to get access token', e, s);
      throw CacheException(cause: 'Failed to get access token');
    }
  }

  @override
  Future<String?> getUserId() async {
    try {
      return await _storage.read(key: _userIdKey);
    } catch (e, s) {
      AppLogger.error('Failed to get user ID', e, s);
      throw CacheException(cause: 'Failed to get user ID');
    }
  }

  @override
  Future<bool> isAuthenticated() async {
    try {
      final token = await _storage.read(key: _accessToken);
      return token != null && token.isNotEmpty;
    } catch (e, s) {
      AppLogger.error('Failed to check authentication status', e, s);
      throw CacheException(cause: 'Failed to check authentication status');
    }
  }

  @override
  Future<void> saveAuth(AuthEntity entity) async {
    try {
      await _storage.write(key: _userIdKey, value: entity.userId);
      await _storage.write(key: _accessToken, value: entity.accessToken);
      await _storage.write(key: _refreshToken, value: entity.refreshToken);
    } catch (e, s) {
      AppLogger.error('Failed to save auth data', e, s);
      throw CacheException(cause: 'Failed to save auth data');
    }
  }

  @override
  Future<void> updateAccessToken(String accessToken) async {
    try {
      await _storage.write(key: _accessToken, value: accessToken);
    } catch (e, s) {
      AppLogger.error('Failed to update access token', e, s);
      throw CacheException(cause: 'Failed to update access token');
    }
  }
}
