import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import 'package:shared/blocs/auth/auth_bloc.dart';
import 'package:shared/utils/context_ext.dart';
import 'package:shared/utils/spacer_ext.dart';
import 'package:shared/widgets/basic_button.dart';
import 'package:shared/widgets/basic_scaffold.dart';

/// =========================================================
/// Created by Pahnal Aditia
/// GitHub  : https://github.com/pahnaladitia
/// LinkedIn: https://www.linkedin.com/in/pahnaladitia
/// =========================================================

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BasicScaffold(
      appBar: AppBar(title: Text(context.l10n.profile)),
      isSingleChildScrollView: false,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              context.l10n.profileDescription,
              style: context.textTheme.headlineMedium,
              textAlign: TextAlign.center,
            ),
            16.paddingY,
            BasicButton.secondary(
              text: context.l10n.signOut,
              icon: const Icon(Icons.logout),

              onPressed: () {
                GetIt.instance.get<AuthBloc>().add(AuthSignOutRequestedEvent());
              },
            ),
          ],
        ),
      ),
    );
  }
}
