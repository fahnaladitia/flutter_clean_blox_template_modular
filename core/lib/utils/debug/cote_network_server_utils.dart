import 'package:core/utils/log/app_logger.dart';
import 'package:cote_network_logger/cote_network_logger.dart';

class CoteNetworkServerUtils {
  /// Starts the Cote Network Logger server.
  static Future<void> startServer() async {
    final bool isStarted = await startNetworkLogServer();
    if (isStarted) {
      AppLogger.info(
        'Cote Network Logger server started successfully on port 3000.',
      );
    } else {
      AppLogger.error('Failed to start Cote Network Logger server.');
    }
  }
}
