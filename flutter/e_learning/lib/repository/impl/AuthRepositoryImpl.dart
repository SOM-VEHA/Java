import 'package:e_learning/core/Supabase.dart';
import 'package:e_learning/repository/AuthRepository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthRepositoryImpl implements AuthRepository {
  @override
  Future<void> logout() async {
    await supabase.auth.signOut();
  }

  @override
  Future<AuthResponse> login({
    required String email,
    required String password,
  }) async {
    return await supabase.auth.signInWithPassword(
      email: email,
      password: password,
    );
  }

  @override
  Future<AuthResponse> register({
    required String username,
    required String email,
    required String password,
  }) async {
    final response = await supabase.auth.signUp(
      email: email,
      password: password,
    );

    if (response.user != null) {
      await supabase.from('profiles').insert({
        'id': response.user!.id,
        'username': username,
        'email': email,
      });
    }

    return response;
  }
}

final authRepositoryProvider = Provider<AuthRepository>(
  (ref) => AuthRepositoryImpl(),
);
