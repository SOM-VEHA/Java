import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'Supabase.dart';

class SupabaseService {
  final SupabaseClient client;

  SupabaseService(this.client);

  Future<List<Map<String, dynamic>>> select(String table) async {
    final response = await client.from(table).select();
    return response;
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

  Future<void> delete(String table, String column, dynamic value) async {
    await client.from(table).delete().eq(column, value);
  }
}

final supabaseServiceProvider = Provider<SupabaseService>((ref) {
  return SupabaseService(supabase);
});
