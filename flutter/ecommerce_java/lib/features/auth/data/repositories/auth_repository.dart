import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthRepository {
  Future<bool> login(String email, String password) async {
    // Simulate API call
    await Future.delayed(const Duration(seconds: 2));
    if (email == 'user@example.com' && password == 'password123') {
      return true;
    }
    return false;
  }

  Future<bool> register(String email, String password) async {
    // Simulate API call
    await Future.delayed(const Duration(seconds: 2));
    return email.contains('@') && password.length >= 6;
  }
}

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  return AuthRepository();
});
