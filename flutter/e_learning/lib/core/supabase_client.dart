import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'Supabase.dart';

class SupabaseService {
  final SupabaseClient client;

  SupabaseService(this.client);

  Future<List<Map<String, dynamic>>> select(
    String table, {
    String columns = '*',
  }) async {
    final response = await client.from(table).select(columns);
    return List<Map<String, dynamic>>.from(response);
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
    return await client.auth.signUp(
      email: email,
      password: password,
    );
  }
  Future<void> logout() async {
    await client.auth.signOut();
  }
}

final supabaseServiceProvider = Provider<SupabaseService>((ref) {
  return SupabaseService(supabase);
});
