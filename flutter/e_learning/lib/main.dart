import 'package:e_learning/screens/Login.dart';
import 'package:e_learning/screens/ProfileScreen.dart';
import 'package:e_learning/screens/splash.dart';
import 'package:e_learning/screens/test.dart';
import 'package:e_learning/widget/Banner.dart';
import 'package:e_learning/widget/Category.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'screens/home_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: 'https://ppfwrhhfgfprnqlgdcre.supabase.co',
    anonKey: 'sb_publishable_NObOfc_mtZUejH0-ffPw1A_CTkOB-b9',
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
      home:  AnimatedCourseListPage(),
    );
  }
}