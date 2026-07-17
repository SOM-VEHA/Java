import 'package:e_learning/controller/FormController/Auth/LoginFormController.dart';
import 'package:e_learning/controller/FormController/Auth/RegisterFormController.dart';
import 'package:e_learning/core/constants/app_strings.dart';
import 'package:e_learning/core/validator/Validators.dart';
import 'package:e_learning/provider/AuthProvider.dart';
import 'package:e_learning/widget/AppPasswordField.dart';
import 'package:e_learning/widget/CustomButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../widget/AppTextField.dart';

class RegisterScreen extends ConsumerStatefulWidget {
  const RegisterScreen({super.key});

  @override
  ConsumerState<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends ConsumerState<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    final formControllerLogin = ref.watch(loginFormProvider);
    final formController = ref.watch(registerFormProvider);
    final authState = ref.watch(authStateProvider);
    final authNotifier = ref.watch(authNotifierProvider);
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 400),
              child: Form(
                key: formController.signupFormKey, // <-- Wrap form
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      'Welcome 👋',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      'Sign up to continue',
                      style: TextStyle(color: Colors.grey.shade700),
                    ),
                    const SizedBox(height: 24),

                    AppTextField(
                      icon: Icons.email,
                      label: 'Email',
                      hintText: 'you@example.com',
                      controller: formController.emailController,
                      validator: Validators.emailValidator,
                      keyboardType: TextInputType.emailAddress,
                    ),
                    const SizedBox(height: 20),

                    AppTextField(
                      icon: Icons.person,
                      label: 'Username',
                      hintText: 'Somveha',
                      controller: formController.usernameController,
                      validator: Validators.nameValidator,
                      keyboardType: TextInputType.text,
                    ),
                    const SizedBox(height: 20),

                    AppPasswordField(
                      icon: Icons.lock,
                      label: 'Password',
                      controller: formController.passwordController,
                      validator: Validators.passwordValidator,
                      obscureText: authState.registerObscurePassword,
                      onToggle: () => ref
                          .read(authStateProvider.notifier)
                          .togglePasswordRegister(),
                    ),
                    const SizedBox(height: 20),

                    AppPasswordField(
                      icon: Icons.lock,
                      label: 'Confirm Password',
                      controller: formController.confirmPasswordController,
                      validator: Validators.passwordValidator,
                      obscureText: authState.registerObscurePassword,
                      onToggle: () => ref
                          .read(authStateProvider.notifier)
                          .togglePasswordRegister(),
                    ),
                    const SizedBox(height: 30),
                    CustomButton(
                      text: AppStrings.registerText,
                      isLoading: authNotifier.isLoading,
                      onPressed: () async {
                        final password = formController.passwordController.text
                            .trim();
                        final conFirmPassword = formController
                            .confirmPasswordController
                            .text
                            .trim();
                        final validation = formController
                            .signupFormKey
                            .currentState!
                            .validate();
                        if (validation) {
                          if (password != conFirmPassword) {
                            print('object');
                          } else {
                            await ref
                                .read(authNotifierProvider.notifier)
                                .register(
                                  formController.usernameController.text.trim(),
                                  formController.emailController.text.trim(),
                                  formController.passwordController.text,
                                );
                            Navigator.pop(context);
                          }
                        }
                      },
                    ),

                    SizedBox(height: 20),
                    Row(
                      children: [
                        Expanded(
                          child: OutlinedButton.icon(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.g_mobiledata_rounded,
                              size: 28,
                            ),
                            label: const Padding(
                              padding: EdgeInsets.symmetric(vertical: 12),
                              child: Text('Sign Up with Google'),
                            ),
                            style: OutlinedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(14),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('Already have an account? '),
                        TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: const Text('Sign In'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
