import 'dart:async';
import 'package:e_learning/model/Favorite.dart';
import 'package:e_learning/repository/FavoriteRepository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../repository/impl/FavoriteRepositoryImpl.dart';

class FavoriteController extends AsyncNotifier<List<Favorite>> {
  FavoriteRepository get repository => ref.read(favoriteRepositoryProvider);

  @override
  Future<List<Favorite>> build() async {
    return repository.findAll();
  }

  Future<void> addFavorite(String courseId) async {
    await repository.addCourse(courseId);
    await refresh();
  }

  Future<void> removeFavorite(String courseId) async {
    await repository.removeCourse(courseId);
    await refresh();
  }

  Future<void> toggleFavorite(String courseId) async {
    if (isFavorite(courseId)) {
      await removeFavorite(courseId);
    } else {
      await addFavorite(courseId);
    }
  }

  Future<void> refresh() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() => repository.findAll());
  }

  bool isFavorite(String courseId) {
    final favorites = state.value ?? [];
    return favorites.any((favorite) => favorite.course_id == courseId);
  }
}
