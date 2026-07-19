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
    final formController = ref.watch(registerFormProvider);
    final authState = ref.watch(authStateProvider);
    final authNotifier = ref.watch(authNotifierProvider);
    Future<void> registerAccount({
      required username,
      required email,
      required password,
    }) async {
      final success = await ref.read(authNotifierProvider.notifier).register(username, email, password);
      if (!mounted){
        return;
      }else{
        if (success) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Account created successfully")),
          );
          Navigator.pop(context);
        } else {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(const SnackBar(content: Text("Register failed")));
        }
      }
    }

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
                      isLoading: authNotifier.isRegisterLoading,
                      onPressed: () async {
                        final username = formController.usernameController.text.trim();
                        final email = formController.emailController.text.trim();
                        final password = formController.passwordController.text.trim();
                        final conFirmPassword = formController.confirmPasswordController.text.trim();
                        final validation = formController.signupFormKey.currentState!.validate();
                        if (validation) {
                          if (password != conFirmPassword) {
                            print('object');
                          } else {
                            await registerAccount(
                              username: username,
                              email: email,
                              password: password,
                            );
                          }
                        }
                      },
                    ),

                    SizedBox(height: 20),
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
