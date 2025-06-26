import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:application/router/route.dart';
import 'package:shared/l10n/app_localizations.dart';
import 'package:shared/l10n/l10n.dart';
import 'package:shared/theme/theme.dart';
import 'package:shared/theme/util.dart';

/// =========================================================
/// Created by Pahnal Aditia
/// GitHub  : https://github.com/fahnaladitia
/// LinkedIn: https://www.linkedin.com/in/pahnaladitia
/// =========================================================

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = createTextTheme(context, "Roboto", "Roboto");
    final MaterialTheme theme = MaterialTheme(textTheme);
    return MaterialApp.router(
      debugShowCheckedModeBanner: kDebugMode,
      routerConfig: AppRoute.router,
      supportedLocales: L10n.all,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      // Set the default locale, you can change it based on user preference
      locale: const Locale('en'),
      darkTheme: theme.dark(),
      theme: theme.light(),
    );
  }
}
