import 'package:flutter/material.dart';
import 'package:shared/shared.dart';

class InputsPreviewPage extends StatefulWidget {
  const InputsPreviewPage({super.key});

  @override
  State<InputsPreviewPage> createState() => _InputsPreviewPageState();
}

class _InputsPreviewPageState extends State<InputsPreviewPage> {
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
              context.l10n.inputsPreviewDescription,
              style: Theme.of(context).textTheme.headlineSmall,
              textAlign: TextAlign.center,
            ),
            24.paddingVertical,
            // outlined active
            BasicTextField.outlined(
              field: 'outlined_active',
              labelText: 'active',
              hintText: 'hint text',
              prefixIcon: const Icon(Icons.search),
              suffixIcon: const Icon(Icons.clear),
            ),
            16.paddingVertical,
            // outlined disabled
            BasicTextField.outlined(
              field: 'outlined_disabled',
              labelText: 'disabled',
              hintText: 'hint text',
              state: BasicTextFieldState.disabled,
            ),
            // outlined error
            16.paddingVertical,
            BasicTextField.outlined(
              field: 'outlined_error',
              labelText: 'error',
              hintText: 'hint text',
              validationUIError: ValidationUIError(
                code: "error_code",
                message: "This is an error message",
                errors: [
                  ValidatorField(
                    fieldName: 'outlined_error',
                    message: 'This is an error message for the field',
                  ),
                ],
              ),
            ),
            16.paddingVertical,
            // underline active
            BasicTextField.underline(
              field: 'underline_active',
              labelText: 'active',
              hintText: 'hint text',
              prefixIcon: const Icon(Icons.search),
              suffixIcon: const Icon(Icons.clear),
            ),
            16.paddingVertical,
            // underline disabled
            BasicTextField.underline(
              field: 'underline_disabled',
              labelText: 'disabled',
              hintText: 'hint text',
              state: BasicTextFieldState.disabled,
            ),
            16.paddingVertical,
            // underline error
            BasicTextField.underline(
              field: 'underline_error',
              labelText: 'error',
              hintText: 'hint text',
              validationUIError: ValidationUIError(
                code: "error_code",
                message: "This is an error message",
                errors: [
                  ValidatorField(
                    fieldName: 'underline_error',
                    message: 'This is an error message for the field',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
