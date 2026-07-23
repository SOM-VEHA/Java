import 'dart:async';
import 'package:e_learning/model/Favorite.dart';
import 'package:e_learning/repository/FavoriteRepository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../repository/impl/FavoriteRepositoryImpl.dart';

class FavoriteController extends AsyncNotifier<List<Favorite>> {
  FavoriteRepository get repository => ref.read(favoriteRepositoryProvider);

  // final Set<String> _favoriteIds = {};

  // int _page = 1;
  // final int _limit = 10;
  // bool _hasMore = true;
  // bool _isLoadingMore = false;

  @override
  Future<List<Favorite>> build() async {
    final favorites = await repository.findAll();
    // _favoriteIds
    //   ..clear()
    //   ..addAll(favorites.map((e) => e.course_id));
    // _hasMore = favorites.length == _limit;
    return favorites;
  }

  // Future<void> loadMore() async {
  //   if (_isLoadingMore || !_hasMore) return;
  //   _isLoadingMore = true;
  //   _page++;
  //   try {
  //     final newFavorites = await repository.findAll(page: _page, limit: _limit);
  //     if (newFavorites.length < _limit) {
  //       _hasMore = false;
  //     }
  //     state = AsyncData([...state.value ?? [], ...newFavorites]);
  //   } finally {
  //     _isLoadingMore = false;
  //   }
  // }

  Future<void> addFavorite(String courseId) async {
    await repository.addCourse(courseId);
    await refresh();
  }

  Future<void> removeFavorite(String courseId) async {
    await repository.removeCourse(courseId);
    await refresh();
  }

  // Future<void> toggleFavorite(String courseId) async {
  //   if (isFavorite(courseId)) {
  //     await removeFavorite(courseId);
  //   } else {
  //     await addFavorite(courseId);
  //   }
  // }

  Future<void> refresh() async {
    // _page = 1;
    // _hasMore = true;
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      // return repository.findAll(page: _page, limit: _limit);
      return repository.findAll();
    });
  }

  // bool isFavorite(String courseId) {
  //   final favorites = state.value ?? [];
  //   return favorites.any((favorite) => favorite.course_id == courseId);
  // }

  // bool isFavorite(String courseId) {
  //   return _favoriteIds.contains(courseId);
  // }

  bool isFavorite(String courseId) {
    final favorites = state.value ?? [];

    return favorites.any((e) => e.course_id == courseId);
  }

  Future<void> toggleFavorite(String courseId) async {
    final oldList = state.value ?? [];

    if (isFavorite(courseId)) {
      final newList = oldList.where((e) => e.course_id != courseId).toList();

      state = AsyncData(newList);

      try {
        await repository.removeCourse(courseId);
      } catch (e) {
        state = AsyncData(oldList);
      }
    } else {
      // add later
    }
  }

  //
  // Future<void> toggleFavorite(String courseId) async {
  //   if (_favoriteIds.contains(courseId)) {
  //     final oldList = state.value ?? [];
  //
  //     // Update Set
  //     _favoriteIds.remove(courseId);
  //
  //     // Update List
  //     final newList = oldList
  //         .where((e) => e.course_id != courseId)
  //         .toList();
  //
  //     state = AsyncData(newList);
  //
  //     try {
  //       await repository.removeCourse(courseId);
  //     } catch (e) {
  //       // Rollback
  //       _favoriteIds.add(courseId);
  //       state = AsyncData(oldList);
  //     }
  //   }
  //   // print('1');
  //   // if (_favoriteIds.contains(courseId)) {
  //   //   print('object1');
  //   //   // Update UI ភ្លាម
  //   //   _favoriteIds.remove(courseId);
  //   //   state = AsyncData([...state.value ?? []]);
  //   //   try {
  //   //     await repository.removeCourse(courseId);
  //   //     // removeFavorite(courseId);
  //   //   } catch (e) {
  //   //     _favoriteIds.add(courseId);
  //   //     state = AsyncData([...state.value ?? []]);
  //   //   }
  //   // } else {
  //   //   print('2');
  //   //   // Update UI ភ្លាម
  //   //   _favoriteIds.add(courseId);
  //   //   state = AsyncData([...state.value ?? []]);
  //   //
  //   //   try {
  //   //     await repository.addCourse(courseId);
  //   //     // await addFavorite(courseId);
  //   //   } catch (e) {
  //   //     _favoriteIds.remove(courseId);
  //   //     state = AsyncData([...state.value ?? []]);
  //   //   }
  //   // }
  // }
}
