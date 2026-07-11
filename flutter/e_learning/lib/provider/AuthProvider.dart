import 'package:e_learning/repository/AuthRepository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../repository/impl/AuthRepositoryImpl.dart';

class AuthNotifier extends StateNotifier<AsyncValue<void>> {
  final AuthRepository authRepository;

  AuthNotifier(this.authRepository) : super(const AsyncData(null));

  Future<void> login(String email, String password) async {
    state = const AsyncLoading();
    try {
      final response = await authRepository.login(
        email: email,
        password: password,
      );
      print(response.user?.email);
      state = const AsyncData(null);
    } on AuthException catch (e) {
      state = AsyncError(e.message, StackTrace.current);
    } catch (e) {
      state = AsyncError(e.toString(), StackTrace.current);
    }
  }
  Future<void> register(String username,String email, String password) async {
    state = const AsyncLoading();
    try {
      final response = await authRepository.register(
        username: username,
        email: email,
        password: password,
      );
      print(response.user?.email);
      state = const AsyncData(null);

    } on AuthException catch (e) {
      state = AsyncError(e.message, StackTrace.current);
    } catch (e) {
      state = AsyncError(e.toString(), StackTrace.current);
    }
  }
}

final authProvider = StateNotifierProvider<AuthNotifier, AsyncValue<void>>((ref) {
  return AuthNotifier(ref.watch(authRepositoryProvider));
});
