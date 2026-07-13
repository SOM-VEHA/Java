import 'package:e_learning/provider/FavoriteProvider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../provider/AuthProvider.dart';
import 'login_screen.dart';
import 'navigation/navigation_screen.dart';

class App extends ConsumerWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final auth = ref.watch(authStateProvider);

    return auth.when(
      loading: () =>
          const Scaffold(body: Center(child: CircularProgressIndicator())),

      error: (e, _) => Scaffold(body: Center(child: Text(e.toString()))),

      data: (user) {
        if (user != null) {
          ref.invalidate(favoriteControllerProvider);
          return Navigation();
        }

        return const LoginPage();
      },
    );
  }
}
