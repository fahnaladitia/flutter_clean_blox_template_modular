import 'package:flutter/material.dart';
import 'package:shared/shared.dart';

class SelectionsPreviewPage extends StatelessWidget {
  const SelectionsPreviewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BasicScaffold(
      appBar: AppBar(title: Text(context.l10n.inputs), centerTitle: true),
      body: Padding(
        padding: 24.edgeHorizontal,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            24.paddingVertical,
            Text(
              context.l10n.selectionsPreviewDescription,
              style: Theme.of(context).textTheme.headlineSmall,
              textAlign: TextAlign.center,
            ),
            24.paddingVertical,
            // basic switch Android
            BasicSwitch.android(
              initialValue: true,
              onChanged: (value) {},
              label: "Basic Switch Android Active",
            ),
            16.paddingVertical,
            // basic switch Android disabled
            BasicSwitch.android(
              initialValue: false,
              onChanged: (value) {},
              state: BasicSwitchState.disabled,
              label: "Basic Switch Android Inactive",
            ),
            16.paddingVertical,
            // basic switch iOS
            BasicSwitch.ios(
              initialValue: true,
              onChanged: (value) {},
              label: "Basic Switch iOS Active",
            ),
            16.paddingVertical,
            // basic switch iOS disabled
            BasicSwitch.ios(
              initialValue: false,
              onChanged: (value) {},
              state: BasicSwitchState.disabled,
              label: "Basic Switch iOS Inactive",
            ),
            16.paddingVertical,
            // basic switch Native
            BasicSwitch.native(
              initialValue: true,
              onChanged: (value) {},
              label: "Basic Switch Native Active",
            ),
            16.paddingVertical,
            // basic switch Native disabled
            BasicSwitch.native(
              initialValue: false,
              onChanged: (value) {},
              state: BasicSwitchState.disabled,
              label: "Basic Switch Native Inactive",
            ),
            16.paddingVertical,
            // basic switch Icon
            BasicSwitch.icon(
              initialValue: true,
              onChanged: (value) {},
              activeIcon: const Icon(Icons.check_circle),
              inactiveIcon: const Icon(Icons.circle_rounded),
              label: "Basic Switch Icon Active",
            ),
            16.paddingVertical,
            // basic switch Icon disabled
            BasicSwitch.icon(
              initialValue: true,
              onChanged: (value) {},
              state: BasicSwitchState.disabled,
              activeIcon: const Icon(Icons.check_circle),
              inactiveIcon: const Icon(Icons.circle_rounded),
              label: "Basic Switch Icon Inactive",
            ),
            24.paddingVertical,
          ],
        ),
      ),
    );
  }
}
