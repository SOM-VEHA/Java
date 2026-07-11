import 'package:e_learning/model/Category.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/supabase_client.dart';
import '../CategoryRepository.dart';

class CategoryRepositoryImpl implements CategoryRepository {
  final SupabaseService service;
  CategoryRepositoryImpl(this.service);
  @override
  Future<List<Category>> findAll() {
    final response = service.select("category");
    return response.then(
      (data) => data.map((e) => Category.fromJson(e)).toList(),
    );
  }
}

final categoryRepositoryProvider = Provider<CategoryRepository>((ref) {
  final service = ref.read(supabaseServiceProvider);
  return CategoryRepositoryImpl(service);
});
