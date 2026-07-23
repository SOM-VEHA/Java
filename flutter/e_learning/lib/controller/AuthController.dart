import 'package:e_learning/controller/state/AuthState/AuthState.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthController extends Notifier<FormAuthState> {
  @override
  FormAuthState build() {
    return const FormAuthState();
  }

  /// Show / Hide Password
  void togglePassword() {
    state = state.copyWith(
      obscurePassword: !state.obscurePassword,
    );
  }

  /// Show / Hide Password //Register
  void togglePasswordRegister() {
    state = state.copyWith(
      registerObscurePassword: !state.registerObscurePassword,
    );
  }

  /// Remember Me
  void toggleRememberMe() {
    state = state.copyWith(
      rememberMe: !state.rememberMe,
    );
  }

  /// Loading UI
  void setLoading(bool value) {
    state = state.copyWith(
      isLoading: value,
    );
  }

  /// Login Status
  void setLoggedIn(bool value) {
    state = state.copyWith(
      isLoggedIn: value,
    );
  }

  /// Reset UI
  void reset() {
    state = const FormAuthState();
  }
}
