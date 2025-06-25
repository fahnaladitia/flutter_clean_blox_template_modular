import '../features/auth/di/shared_auth_module.dart';

class SharedModule {
  SharedModule._();

  static Future<void> init() async {
    SharedAuthModule.init();
  }
}
