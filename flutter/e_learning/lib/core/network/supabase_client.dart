import 'package:e_learning/core/exception/server_exception.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../Supabase.dart';

class SupabaseService {
  final SupabaseClient client;
  SupabaseService(this.client);

  Future<void> signInWithGoogle() async {
    final GoogleSignIn googleSignIn = GoogleSignIn(
      serverClientId: '751838681381-2l8l6m8fmsok3r359ccd0dudnh8ubbsa.apps.googleusercontent.com',
    );

    final googleUser = await googleSignIn.signIn();

    if (googleUser == null) {
      return;
    }

    final googleAuth = await googleUser.authentication;
    final idToken = googleAuth.idToken;
    final accessToken = googleAuth.accessToken;
    if (idToken == null) {
      throw Exception("Google ID Token is null");
    }
    await client.auth.signInWithIdToken(
      provider: OAuthProvider.google,
      idToken: idToken,
      accessToken: accessToken,
    );
  }

  Future<List<Map<String, dynamic>>> select(
    String table, {
    String columns = '*',
  }) async {
    try {
      final response = await client.from(table).select(columns);
      return List<Map<String, dynamic>>.from(response);
    } on PostgrestException catch (e) {
      throw ServerException(e.message);
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  Future<Map<String, dynamic>> selectById(
    String table,
    String column,
    dynamic value,
  ) async {
    try {
      final response = await client
          .from(table)
          .select()
          .eq(column, value)
          .single();
      return Map<String, dynamic>.from(response);
    } on PostgrestException catch (e) {
      throw ServerException(e.message);
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  Future<void> insert(String table, Map<String, dynamic> data) async {
    await client.from(table).insert(data);
  }

  Future<void> update(
    String table,
    Map<String, dynamic> data,
    String column,
    dynamic value,
  ) async {
    await client.from(table).update(data).eq(column, value);
  }

  Future<void> delete(String table, Map<String, dynamic> filters) async {
    var query = client.from(table).delete();
    filters.forEach((column, value) {
      query = query.eq(column, value);
    });
    await query;
  }

  Future<AuthResponse> login({
    required String email,
    required String password,
  }) async {
    return await client.auth.signInWithPassword(
      email: email,
      password: password,
    );
  }

  Future<AuthResponse> register({
    required String email,
    required String password,
  }) async {
    return await client.auth.signUp(email: email, password: password);
  }

  Future<void> logout() async {
    await client.auth.signOut();
  }
}

final supabaseServiceProvider = Provider<SupabaseService>((ref) {
  return SupabaseService(supabase);
});
