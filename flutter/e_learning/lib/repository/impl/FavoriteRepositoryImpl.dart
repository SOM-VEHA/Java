import 'package:e_learning/core/supabase_client.dart';
import 'package:e_learning/model/Favorite.dart';
import 'package:e_learning/repository/FavoriteRepository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FavoriteRepositoryImpl extends FavoriteRepository {
  final SupabaseService supabaseService;
  FavoriteRepositoryImpl(this.supabaseService);
  @override
  Future<void> addCourse(String courseId) async {
    final user = supabaseService.client.auth.currentUser;
    if (user == null) {
      throw Exception("User មិនទាន់ Login");
    } else {
      await supabaseService.insert("favorite", {
        "user_id": user.id,
        "course_id": courseId,
      });
    }
  }

  @override
  Future<void> removeCourse(String courseId) async {
    final user = supabaseService.client.auth.currentUser;
    if (user == null) {
      throw Exception("User not logged in");
    }
    await supabaseService.delete("favorite", {
      "user_id": user.id,
      "course_id": courseId,
    });
  }

  @override
  Future<List<Favorite>> findAll() async {
    final response = await supabaseService.select(
      "favorite",
      columns: '''*,course(*)''',
    );
    return response.map((e) => Favorite.fromJson(e)).toList();
  }
}

final favoriteRepositoryProvider = Provider<FavoriteRepository>((ref) {
  final service = ref.watch(supabaseServiceProvider);
  return FavoriteRepositoryImpl(service);
});
