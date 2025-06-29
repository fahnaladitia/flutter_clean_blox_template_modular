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
            Divider(),
            24.paddingVertical,
            Text(
              "Basic Checkbox",
              style: Theme.of(context).textTheme.headlineSmall,
            ),
          ],
        ),
      ),
    );
  }
}
