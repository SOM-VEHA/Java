import 'package:e_learning/core/Supabase.dart';
import 'package:e_learning/core/network/supabase_client.dart';
import 'package:e_learning/screens/auth/LoginScreen.dart';
import 'package:e_learning/screens/auth/RegisterScreen.dart';
import 'package:e_learning/screens/splash/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'screens/search_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: SupabaseService.url,
    anonKey: SupabaseService.anonKey,
  );

  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Programming E-Learning',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blueAccent,
          primary: Colors.blueAccent,
        ),
        useMaterial3: true,
        fontFamily: 'Roboto',
      ),
      home:SplashScreen(),
      // home: Navigation(),
    );
  }
}