import 'package:ecommerce_java/core/theme/app_theme.dart';
import 'package:ecommerce_java/features/auth/presentation/pages/login_page.dart';
import 'package:ecommerce_java/features/home/presentation/pages/home_page.dart';
import 'package:ecommerce_java/features/auth/presentation/providers/auth_provider.dart';
import 'package:ecommerce_java/core/providers/storage_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  
  runApp(
    ProviderScope(
      overrides: [
        sharedPreferencesProvider.overrideWithValue(prefs),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authProvider);

    return MaterialApp(
      title: 'Riverpod Ecommerce',
      theme: AppTheme.lightTheme,
      debugShowCheckedModeBanner: false,
      home: authState.isAuthenticated ? const HomePage() : const LoginPage(),
      // home:AlertDialogApp(),
    );
  }
}
