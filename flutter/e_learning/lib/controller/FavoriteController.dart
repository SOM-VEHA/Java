import 'dart:async';
import 'package:e_learning/model/Favorite.dart';
import 'package:e_learning/repository/FavoriteRepository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../provider/AuthProvider.dart';
import '../repository/impl/FavoriteRepositoryImpl.dart';
class FavoriteController extends AsyncNotifier<List<Favorite>> {
  FavoriteRepository get repository => ref.read(favoriteRepositoryProvider);

  @override
  Future<List<Favorite>> build() async {
    // ref.watch(authStateProvider);
    return repository.findAll();
  }

  Future<void> addFavorite(String courseId) async {
    await repository.addCourse(courseId);
    // ref.invalidateSelf();
    await refresh();
  }

  Future<void> removeFavorite(String courseId) async {
    await repository.removeCourse(courseId);
    await refresh();
    // ref.invalidateSelf();
  }

  Future<void> refresh() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() => repository.findAll());
  }

  bool isFavorite(String courseId, List<Favorite> favorites) {
    return favorites.any((favorite) => favorite.course_id == courseId);
  }
}
