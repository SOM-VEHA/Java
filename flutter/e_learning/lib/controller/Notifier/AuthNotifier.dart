import 'package:e_learning/controller/state/AuthState/AuthState.dart';
import 'package:e_learning/repository/AuthRepository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthNotifier extends StateNotifier<FormAuthState> {

  final AuthRepository authRepository;

  AuthNotifier(this.authRepository) : super(FormAuthState());

  Future<bool> login(String email, String password) async {
    state = state.copyWith(isLoading: true);
    try {
      final response = await authRepository.login(
        email: email,
        password: password,
      );

      if (response.user != null) {
        return true; // login success
      }
      return false;
    } catch (e) {
      print(e);
      return false;
    } finally {
      state = state.copyWith(isLoading: false);
    }
  }

  Future<bool> register(String username, String email, String password) async {
    state = state.copyWith(isRegisterLoading: true);
    try {
      final response = await authRepository.register(
        username: username,
        email: email,
        password: password,
      );
      return response.user != null;
    } catch (e) {
      debugPrint(e.toString());
      return false;
    } finally {
      state = state.copyWith(isRegisterLoading: false);
    }
  }

  Future<void> logout() async {
    await authRepository.logout();
  }

  Future<void> signInWithGoogle() async {
    state = state.copyWith(isGoogleLoading: true);
    try {
      await authRepository.signInWithGoogle();
      print("Google Sign In Success");
    } catch (e) {
      print("Google Sign In Failed: $e");
    } finally {
      state = state.copyWith(isGoogleLoading: false);
    }
  }
}
