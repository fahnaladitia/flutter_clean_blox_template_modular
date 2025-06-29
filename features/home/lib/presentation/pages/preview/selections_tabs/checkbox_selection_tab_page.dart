import 'package:flutter/material.dart';
import 'package:shared/shared.dart';

class CheckboxSelectionTabPage extends StatelessWidget {
  const CheckboxSelectionTabPage({super.key});

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
              "Basic Checkbox - Android",
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            24.paddingVertical,
            // basic checkbox Android
            BasicCheckbox.android(
              initialValue: true,
              onChanged: (value) {},
              label: "Basic Checkbox Android Active",
            ),
            16.paddingVertical,
            // basic checkbox Android disabled
            BasicCheckbox.android(
              initialValue: false,
              onChanged: (value) {},
              state: BasicSelectionState.disabled,
              label: "Basic Checkbox Android Inactive",
            ),
            16.paddingVertical,
            BasicCheckbox.android(
              initialValue: true,
              onChanged: (value) {},

              label: "Basic Checkbox Android With Color",
            ),
            16.paddingVertical,
            Divider(),
            24.paddingVertical,
            Text(
              "Basic Checkbox - iOS",

              style: Theme.of(context).textTheme.headlineSmall,
            ),
            24.paddingVertical,
            // basic switch iOS
            BasicCheckbox.ios(
              initialValue: true,
              onChanged: (value) {},
              label: "Basic Checkbox iOS Active",
            ),
            16.paddingVertical,
            // basic switch iOS disabled
            BasicCheckbox.ios(
              initialValue: false,
              onChanged: (value) {},
              state: BasicSelectionState.disabled,
              label: "Basic Checkbox iOS Inactive",
            ),
            16.paddingVertical,
            BasicCheckbox.ios(
              initialValue: true,
              onChanged: (value) {},

              label: "Basic Checkbox IOS With Color",
            ),
            16.paddingVertical,
            Divider(),
            24.paddingVertical,
            Text(
              "Basic Checkbox - Adaptive",
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            24.paddingVertical,
            // basic switch Native
            BasicCheckbox.adaptive(
              initialValue: true,
              onChanged: (value) {},
              label: "Basic Checkbox Adaptive Active",
            ),
            16.paddingVertical,
            // basic switch Adaptive disabled
            BasicCheckbox.adaptive(
              initialValue: false,
              onChanged: (value) {},
              state: BasicSelectionState.disabled,
              label: "Basic Checkbox Adaptive Inactive",
            ),
            16.paddingVertical,
            BasicCheckbox.adaptive(
              initialValue: true,
              onChanged: (value) {},

              label: "Basic Checkbox Adaptive With Color",
            ),
            24.paddingVertical,
          ],
        ),
      ),
    );
  }
}
