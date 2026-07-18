import 'package:supabase_flutter/supabase_flutter.dart';

abstract class AuthRepository {
  Future<AuthResponse> login({required String email, required String password});

  Future<AuthResponse> register({
    required String username,
    required String email,
    required String password,
  });

  Future<void> logout();

  // Future<void> signInWithGoogle();
}
