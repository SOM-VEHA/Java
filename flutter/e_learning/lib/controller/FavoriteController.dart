import 'dart:async';
import 'package:e_learning/model/Favorite.dart';
import 'package:e_learning/repository/FavoriteRepository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../repository/impl/FavoriteRepositoryImpl.dart';

// class FavoriteController extends AsyncNotifier<List<Favorite>> {
//   late final FavoriteRepository favoriteRepository;
//
//   @override
//   FutureOr<List<Favorite>> build() async {
//     favoriteRepository = ref.watch(favoriteRepositoryProvider);
//     return await favoriteRepository.findAll();
//   }
//
//   Future<void> addFavorite(String courseId) async {
//     await favoriteRepository.addCourse(courseId);
//     ref.invalidateSelf();
//   }
//
//   Future<void> removeFavorite(String courseId) async {
//     await favoriteRepository.removeCourse(courseId);
//     ref.invalidateSelf();
//   }
// }
class FavoriteController extends AsyncNotifier<List<Favorite>> {
  FavoriteRepository get repository => ref.read(favoriteRepositoryProvider);

  @override
  Future<List<Favorite>> build() async {
    return repository.findAll();
  }

  Future<void> addFavorite(String courseId) async {
    await repository.addCourse(courseId);
    ref.invalidateSelf();
  }

  Future<void> removeFavorite(String courseId) async {
    await repository.removeCourse(courseId);
    ref.invalidateSelf();
  }

  bool isFavorite(String courseId, List<Favorite> favorites) {
    return favorites.any((favorite) => favorite.course_id == courseId);
  }
}
