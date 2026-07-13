import 'package:e_learning/provider/FavoriteProvider.dart';
import 'package:e_learning/screens/navigation/navigation_screen.dart';
import 'package:e_learning/screens/register_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../provider/AuthProvider.dart';

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({super.key});

  @override
  ConsumerState<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  void login() async {
    await ref
        .read(authProvider.notifier)
        .login(emailController.text.trim(), passwordController.text.trim());

    final state = ref.read(authProvider);
    if (!mounted) return;
    state.when(
      data: (_)async {
        ref.invalidate(favoriteControllerProvider);
        await ref.read(favoriteControllerProvider.future);
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(const SnackBar(content: Text("Login Successful")));
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => Navigation()),
        );
      },

      loading: () {},

      error: (error, stack) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text(error.toString())));
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final authState = ref.watch(authProvider);

    final isLoading = authState.isLoading;

    return Scaffold(
      appBar: AppBar(title: const Text("Login")),

      body: Padding(
        padding: const EdgeInsets.all(20),

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,

          children: [
            TextField(
              controller: emailController,

              keyboardType: TextInputType.emailAddress,

              decoration: const InputDecoration(
                labelText: "Email",

                prefixIcon: Icon(Icons.email),

                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 20),

            TextField(
              controller: passwordController,

              obscureText: true,

              decoration: const InputDecoration(
                labelText: "Password",

                prefixIcon: Icon(Icons.lock),

                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 30),

            SizedBox(
              width: double.infinity,

              height: 50,

              child: ElevatedButton(
                onPressed: isLoading ? null : login,

                child: isLoading
                    ? const SizedBox(
                        height: 25,

                        width: 25,

                        child: CircularProgressIndicator(strokeWidth: 2),
                      )
                    : const Text("LOGIN", style: TextStyle(fontSize: 16)),
              ),
            ),

            const SizedBox(height: 10),

            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const RegisterPage()),
                );
              },
              child: const Text("Don't have an account? Register"),
            ),
          ],
        ),
      ),
    );
  }
}
