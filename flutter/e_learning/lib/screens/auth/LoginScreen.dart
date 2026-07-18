import 'package:e_learning/controller/FormController/Auth/LoginFormController.dart';
import 'package:e_learning/core/constants/app_strings.dart';
import 'package:e_learning/core/validator/Validators.dart';
import 'package:e_learning/provider/AuthProvider.dart';
import 'package:e_learning/screens/auth/RegisterScreen.dart';
import 'package:e_learning/screens/navigation/navigation_screen.dart';
import 'package:e_learning/widget/AppPasswordField.dart';
import 'package:e_learning/widget/AppTextField.dart';
import 'package:e_learning/widget/CustomButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    print("LOGIN BUILD");
    final formController = ref.watch(loginFormProvider);
    final authState = ref.watch(authStateProvider);
    final authNotifier = ref.watch(authNotifierProvider);
    Future<void> signInWithGoogle() async {
      await ref.read(authNotifierProvider.notifier).signInWithGoogle();
    }

    Future<void> loginAccount({required email, required password}) async {
      final success = await ref
          .read(authNotifierProvider.notifier)
          .login(email, password);
      if (!mounted) return;
      if (success) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(const SnackBar(content: Text("Login Success")));
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => Navigation()),
        );
      } else {
        print("Login Failed");
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Email or password incorrect")),
        );
      }
    }

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 400),
              child: Form(
                key: formController.loginFormKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      'Welcome back 👋',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      'Sign in to continue',
                      style: TextStyle(color: Colors.grey.shade700),
                    ),
                    const SizedBox(height: 24),
                    AppTextField(
                      icon: Icons.email,
                      label: AppStrings.emailText,
                      hintText: 'you@example.com',
                      controller: formController.emailController,
                      validator: Validators.emailValidator,
                      keyboardType: TextInputType.emailAddress,
                    ),
                    SizedBox(height: 30),
                    AppPasswordField(
                      icon: Icons.password,
                      label: 'Password',
                      controller: formController.passwordController,
                      validator: Validators.passwordValidator,
                      obscureText: authState.obscurePassword,
                      onToggle: () {
                        ref.read(authStateProvider.notifier).togglePassword();
                      },
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Checkbox(
                          value: authState.rememberMe,
                          onChanged: (_) {
                            ref
                                .read(authStateProvider.notifier)
                                .toggleRememberMe();
                          },
                        ),
                        const Text('Remember me'),
                        const Spacer(),
                        TextButton(
                          onPressed: () {
                            // TODO: Forgot password flow
                          },
                          child: const Text('Forgot Password?'),
                        ),
                      ],
                    ),
                    SizedBox(height: 8),
                    CustomButton(
                      text: "Sign In",
                      isLoading: authNotifier.isLoading,
                      onPressed: () async {
                        if (formController.loginFormKey.currentState!
                            .validate()) {
                          final email = formController.emailController.text
                              .trim();
                          final password = formController
                              .passwordController
                              .text
                              .trim();
                          loginAccount(email: email, password: password);
                        }
                      },
                    ),
                    SizedBox(height: 20),

                    OutlinedButton.icon(
                      onPressed: () async {
                        await ref
                            .read(authNotifierProvider.notifier)
                            .signInWithGoogle();
                      },
                      icon: const Icon(Icons.g_mobiledata),
                      label: authState.isGoogleLoading
                          ? const CircularProgressIndicator()
                          : const Text("Sign in with Google"),
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: OutlinedButton.icon(
                            onPressed: () async {
                              await signInWithGoogle();
                            },
                            icon: const Icon(
                              Icons.g_mobiledata_rounded,
                              size: 28,
                            ),
                            label: const Padding(
                              padding: EdgeInsets.symmetric(vertical: 12),
                              child: Text('Sign in with Google'),
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
                        const Text("Don't have an account? "),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const RegisterScreen(),
                              ),
                            );
                          },
                          child: const Text('Sign Up'),
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
