import 'package:feature_auth/presentation/blocs/sign_up/sign_up_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:shared/extensions/extensions.dart';

import 'package:go_router/go_router.dart';
import 'package:shared/widgets/widgets.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  late final TextEditingController _nameController;
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;
  late final TextEditingController _confirmPasswordController;

  GetIt getIt = GetIt.instance;

  bool isValid = false;

  late final SignUpBloc _signUpBloc;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _signUpBloc = getIt.get();
    _nameController = TextEditingController();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _confirmPasswordController = TextEditingController();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _signUpBloc,
      child: BlocListener<SignUpBloc, SignUpState>(
        listener: (context, state) {
          if (state is SignUpSuccess) {
            context.goNamed('main');
          } else if (state is SignUpFailure) {
            context.showError(state.error);
          }
        },
        child: BasicScaffold(
          body: Form(
            key: _formKey,
            onChanged: () {
              final isEmailFilled = _emailController.text.isNotEmpty;
              final isPasswordFilled = _passwordController.text.isNotEmpty;
              if (isValid != (isEmailFilled && isPasswordFilled)) {
                setState(() {
                  isValid = isEmailFilled && isPasswordFilled;
                });
              }
            },
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Padding(
              padding: 24.edgeX,
              child: Column(
                children: [
                  100.paddingY,
                  Text(
                    context.l10n.signUp,
                    style: context.textTheme.headlineMedium,
                  ),
                  16.paddingY,
                  Text(
                    context.l10n.signUpDescription,
                    style: context.textTheme.bodyMedium,
                    textAlign: TextAlign.center,
                  ),
                  16.paddingY,
                  BlocBuilder<SignUpBloc, SignUpState>(
                    builder: (context, state) {
                      final isLoading = state is SignUpLoading;
                      return BasicTextInput(
                        controller: _nameController,
                        labelText: context.l10n.name,
                        readOnly: isLoading,
                      );
                    },
                  ),
                  16.paddingY,
                  BlocBuilder<SignUpBloc, SignUpState>(
                    builder: (context, state) {
                      final isLoading = state is SignUpLoading;
                      return BasicTextInput(
                        controller: _emailController,
                        labelText: context.l10n.email,
                        hintText: context.l10n.emailHint,
                        keyboardType: TextInputType.emailAddress,
                        readOnly: isLoading,
                      );
                    },
                  ),
                  16.paddingY,
                  BlocBuilder<SignUpBloc, SignUpState>(
                    builder: (context, state) {
                      return BasicTextInput(
                        controller: _passwordController,
                        labelText: context.l10n.password,
                        hintText: context.l10n.passwordHint,
                        obscureText: true,
                        readOnly: state is SignUpLoading,
                      );
                    },
                  ),
                  16.paddingY,
                  BlocBuilder<SignUpBloc, SignUpState>(
                    builder: (context, state) {
                      return BasicTextInput(
                        controller: _confirmPasswordController,
                        labelText: context.l10n.confirmPassword,
                        hintText: context.l10n.confirmPasswordHint,
                        obscureText: true,
                        readOnly: state is SignUpLoading,
                      );
                    },
                  ),
                  16.paddingY,
                  BlocBuilder<SignUpBloc, SignUpState>(
                    builder: (context, state) {
                      final isLoading = state is SignUpLoading;
                      return BasicButton.primary(
                        text: context.l10n.signUpButton,
                        state: isLoading
                            ? BasicButtonState.loading
                            : isValid
                            ? BasicButtonState.active
                            : BasicButtonState.disabled,
                        onPressed: () {
                          // Handle sign-in logic here
                          if (!isValid || isLoading) return;
                          if (!_formKey.currentState!.validate()) return;
                          _signUpBloc.add(
                            SignUpRequestedEvent(
                              email: _emailController.text,
                              password: _passwordController.text,
                              name: _nameController.text,
                              confirmPassword: _confirmPasswordController.text,
                            ),
                          );
                        },
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
