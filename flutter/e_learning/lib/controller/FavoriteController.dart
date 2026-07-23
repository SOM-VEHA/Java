import 'package:e_learning/model/Favorite.dart';
import 'package:e_learning/repository/impl/FavoriteRepositoryImpl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../repository/FavoriteRepository.dart';

class FavoriteController extends AsyncNotifier<List<Favorite>> {
  FavoriteRepository get repository => ref.read(favoriteRepositoryProvider);

  @override
  Future<List<Favorite>> build() async {
    final favorites = await repository.findAll();
    return favorites;
  }

  bool isFavorite(String courseId) {
    final favorites = state.value ?? [];

    return favorites.any((e) => e.course_id == courseId);
  }

  Future<void> toggleFavorite(String courseId) async {
    final oldList = state.value ?? [];

    if (isFavorite(courseId)) {
      // optimistic remove
      final newList = oldList.where((e) => e.course_id != courseId).toList();

      state = AsyncData(newList);

      try {
        await repository.removeCourse(courseId);
      } catch (e) {
        // rollback
        state = AsyncData(oldList);

        print("REMOVE ERROR $e");
      }
    } else {
      try {
        // API add first
        final favorite = await repository.addCourse(courseId);

        // update UI
        state = AsyncData([...oldList, favorite]);
      } catch (e) {
        print("ADD ERROR $e");

        state = AsyncData(oldList);
      }
    }
  }
}
