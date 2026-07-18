import 'package:e_learning/controller/state/AuthState.dart';
import 'package:e_learning/repository/AuthRepository.dart';
import 'package:flutter_riverpod/legacy.dart';

class AuthNotifier extends StateNotifier<FormAuthState> {
  final AuthRepository authRepository;

  AuthNotifier(this.authRepository) : super(FormAuthState());

  Future<void> login(String email, String password) async {
    state = state.copyWith(isLoading: true);
    try {
      final response = await authRepository.login(
        email: email,
        password: password,
      );
      print(response.user?.email);
    } catch (e) {
      print(e);
    } finally {
      state = state.copyWith(isLoading: false);
    }
  }

  Future<void> register(String username, String email, String password) async {
    state = state.copyWith(isRegisterLoading: true);
    try {
      final response = await authRepository.register(
        username: username,
        email: email,
        password: password,
      );
      print(response.user?.email);
    } catch (e) {
      print(e);
    } finally {
      state = state.copyWith(isRegisterLoading: false);
    }
  }

  // Future<void> signInWithGoogle() async {
  //   state = state.copyWith(isGoogleLoading: true);
  //   try {
  //     await authRepository.signInWithGoogle();
  //     print("Google Sign In Success");
  //   } catch (e) {
  //     print(e);
  //   } finally {
  //     state = state.copyWith(isGoogleLoading: false);
  //   }
  // }

  Future<void> logout() async {
    await authRepository.logout();
  }

  // Future<void> login(String email, String password) async {
  //   state = const AsyncLoading();
  //   state = await AsyncValue.guard(() async {
  //     final response = await authRepository.login(
  //       email: email,
  //       password: password,
  //     );
  //     print(response.user?.email);
  //   });
  // }

  // Future<void> register(String username, String email, String password) async {
  //   state = const AsyncLoading();
  //   state = await AsyncValue.guard(() async {
  //     final response = await authRepository.register(
  //       username: username,
  //       email: email,
  //       password: password,
  //     );
  //     print(response.user?.email);
  //   });
  // }

  // Future<void> signInWithGoogle() async {
  //   state = const AsyncLoading();
  //   state = await AsyncValue.guard(() => authRepository.signInWithGoogle());
  //   print("Google Sign In Success");
  // }

  // Future<void> logout() async {
  //   state = const AsyncLoading();
  //   state = await AsyncValue.guard(() => authRepository.logout());
  // }
}
