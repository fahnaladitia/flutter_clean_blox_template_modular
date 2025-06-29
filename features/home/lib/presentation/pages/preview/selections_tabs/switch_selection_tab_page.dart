import 'package:flutter/material.dart';
import 'package:shared/shared.dart';

class SwitchSelectionTabPage extends StatelessWidget {
  const SwitchSelectionTabPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BasicScaffold(
      body: Padding(
        padding: 24.edgeHorizontal,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            24.paddingVertical,
            Text(
              "Basic Switch - Android",
              style: Theme.of(context).textTheme.headlineSmall,
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
            BasicSwitch.android(
              initialValue: true,
              onChanged: (value) {},
              activeIcon: const Icon(Icons.light_mode),
              inactiveIcon: const Icon(Icons.dark_mode),
              activeColor: Colors.yellow,
              inactiveColor: Colors.blue,
              activeBackgroundColor: Colors.yellow,
              inactiveBackgroundColor: Colors.black,
              label: "Basic Switch Android With Icons",
            ),
            16.paddingVertical,
            Divider(),
            24.paddingVertical,
            Text(
              "Basic Switch - iOS",
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            24.paddingVertical,
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
            BasicSwitch.ios(
              initialValue: true,
              onChanged: (value) {},
              activeIcon: const Icon(Icons.light_mode),
              inactiveIcon: const Icon(Icons.dark_mode),
              activeColor: Colors.yellow,
              inactiveColor: Colors.blue,
              activeBackgroundColor: Colors.yellow,
              inactiveBackgroundColor: Colors.black,
              label: "Basic Switch IOS With Icons",
            ),
            16.paddingVertical,
            Divider(),
            24.paddingVertical,
            Text(
              "Basic Switch - Adaptive",
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            24.paddingVertical,
            // basic switch Native
            BasicSwitch.adaptive(
              initialValue: true,
              onChanged: (value) {},
              label: "Basic Switch Adaptive Active",
            ),
            16.paddingVertical,
            // basic switch Adaptive disabled
            BasicSwitch.adaptive(
              initialValue: false,
              onChanged: (value) {},
              state: BasicSwitchState.disabled,
              label: "Basic Switch Adaptive Inactive",
            ),
            16.paddingVertical,
            BasicSwitch.adaptive(
              initialValue: true,
              onChanged: (value) {},
              activeIcon: const Icon(Icons.light_mode),
              inactiveIcon: const Icon(Icons.dark_mode),
              activeColor: Colors.yellow,
              inactiveColor: Colors.blue,
              activeBackgroundColor: Colors.yellow,
              inactiveBackgroundColor: Colors.black,
              label: "Basic Switch Adaptive With Icons",
            ),
            16.paddingVertical,
            Divider(),
            24.paddingVertical,
            Text(
              "Basic Switch - Icon",
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            24.paddingVertical,
            // basic switch Icon
            BasicSwitch.icon(
              initialValue: true,
              onChanged: (value) {},
              activeIcon: const Icon(Icons.favorite),
              label: "Basic Switch Icon Active",
            ),
            16.paddingVertical,
            // basic switch Icon disabled
            BasicSwitch.icon(
              initialValue: true,
              onChanged: (value) {},
              state: BasicSwitchState.disabled,
              activeIcon: const Icon(Icons.favorite),
              label: "Basic Switch Icon Inactive",
            ),
            16.paddingVertical,
            // basic switch Icon custom colors
            BasicSwitch.icon(
              initialValue: true,
              onChanged: (value) {},
              activeIcon: const Icon(Icons.light_mode),
              inactiveIcon: const Icon(Icons.dark_mode),
              label: "Basic Switch Icon Custom Colors",
              activeColor: Colors.yellow,
              inactiveColor: Colors.blue,
              activeBackgroundColor: Colors.white,
              inactiveBackgroundColor: Colors.black,
              elevation: 10.0,
            ),
            24.paddingVertical,
          ],
        ),
      ),
    );
  }
}
