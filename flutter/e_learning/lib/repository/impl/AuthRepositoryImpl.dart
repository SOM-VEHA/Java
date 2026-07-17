import 'package:e_learning/core/network/supabase_client.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../AuthRepository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final SupabaseService service;
  AuthRepositoryImpl({required this.service});
  @override
  Future<void> logout() async {
    await service.logout();
  }

  @override
  Future<AuthResponse> login({
    required String email,
    required String password,
  }) async {
    return await service.login(email: email, password: password);
  }

  @override
  Future<AuthResponse> register({
    required String username,
    required String email,
    required String password,
  }) async {
    final response = await service.register(email: email, password: password);
    if (response.user != null) {
      await service.insert("user", {
        'auth_id': response.user!.id,
        'username': username,
        'email': email,
      });
    }
    return response;
  }

  @override
  Future<void> signInWithGoogle()async {
    await service.signInWithGoogle();
  }
}

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  final service = ref.watch(supabaseServiceProvider);
  return AuthRepositoryImpl(service: service);
});
