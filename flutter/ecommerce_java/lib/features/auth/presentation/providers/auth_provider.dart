import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/repositories/auth_repository.dart';
import '../../domain/models/user.dart';
import '../../../../core/providers/storage_provider.dart';

class AuthState {
  final User? user;
  final bool isLoading;
  final String? errorMessage;

  AuthState({
    this.user,
    this.isLoading = false,
    this.errorMessage,
  });

  bool get isAuthenticated => user != null;

  AuthState copyWith({
    User? user,
    bool? isLoading,
    String? errorMessage,
  }) {
    return AuthState(
      user: user ?? this.user,
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage,
    );
  }
}

class AuthNotifier extends Notifier<AuthState> {
  late final AuthRepository _repository;
  static const _userKey = 'auth_user';

  @override
  AuthState build() {
    _repository = ref.watch(authRepositoryProvider);
    final prefs = ref.watch(sharedPreferencesProvider);
    
    final userJson = prefs.getString(_userKey);
    if (userJson != null) {
      try {
        final user = User.fromJson(jsonDecode(userJson));
        return AuthState(user: user);
      } catch (_) {
        return AuthState();
      }
    }
    
    return AuthState();
  }

  Future<void> login(String email, String password) async {
    state = state.copyWith(isLoading: true, errorMessage: null);
    
    try {
      final success = await _repository.login(email, password);
      if (success) {
        final user = User(
          id: '1', 
          email: email,
          name: 'John Doe',
          phoneNumber: '+1 234 567 890',
          address: '123 Main St, New York, NY 10001',
          avatarUrl: 'https://images.unsplash.com/photo-1472099645785-5658abf4ff4e?q=80&w=200&auto=format&fit=crop',
        );
        final prefs = ref.read(sharedPreferencesProvider);
        await prefs.setString(_userKey, jsonEncode(user.toJson()));
        
        state = state.copyWith(
          isLoading: false, 
          user: user,
        );
      } else {
        state = state.copyWith(
          isLoading: false,
          errorMessage: 'Invalid email or password',
        );
      }
    } catch (e) {
      state = state.copyWith(isLoading: false, errorMessage: e.toString());
    }
  }

  Future<void> register(String email, String password) async {
    state = state.copyWith(isLoading: true, errorMessage: null);

    try {
      final success = await _repository.register(email, password);
      if (success) {
        final user = User(
          id: '1', 
          email: email,
          name: 'John Doe',
          phoneNumber: '+1 234 567 890',
          address: '123 Main St, New York, NY 10001',
          avatarUrl: 'https://images.unsplash.com/photo-1472099645785-5658abf4ff4e?q=80&w=200&auto=format&fit=crop',
        );
        final prefs = ref.read(sharedPreferencesProvider);
        await prefs.setString(_userKey, jsonEncode(user.toJson()));

        state = state.copyWith(
          isLoading: false, 
          user: user,
        );
      } else {
        state = state.copyWith(
          isLoading: false,
          errorMessage: 'Registration failed. Check your details.',
        );
      }
    } catch (e) {
      state = state.copyWith(isLoading: false, errorMessage: e.toString());
    }
  }

  Future<void> logout() async {
    final prefs = ref.read(sharedPreferencesProvider);
    await prefs.remove(_userKey);
    state = AuthState();
  }
}

final authProvider = NotifierProvider<AuthNotifier, AuthState>(AuthNotifier.new);
