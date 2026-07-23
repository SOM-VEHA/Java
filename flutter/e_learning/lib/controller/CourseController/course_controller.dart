import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../model/Course.dart';
import '../../repository/CourseRepository.dart';
import '../../repository/impl/CourseRepositoryImpl.dart';

class CourseController extends AsyncNotifier<List<Course>> {
  int _page = 1;
  final int _limit = 10;
  bool _hasMore = true;
  bool _isLoadingMore = false;
  CourseRepository get repository => ref.read(courseRepositoryProvider);
  @override
  FutureOr<List<Course>> build() async {
    final courses = await repository.findAll(page: _page, limit: _limit);
    _hasMore = courses.length == _limit;
    return courses;
  }

  Future<void> loadMore() async {
    if (_isLoadingMore || !_hasMore) return;
    _isLoadingMore = true;
    _page++;
    try {
      final newCourses = await repository.findAll(page: _page, limit: _limit);
      if (newCourses.length < _limit) {
        _hasMore = false;
      }
      state = AsyncData([...state.value ?? [], ...newCourses]);
    } finally {
      _isLoadingMore = false;
    }
  }

  Future<void> refresh() async {
    _page = 1;
    _hasMore = true;
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      return repository.findAll(page: _page, limit: _limit);
    });
  }
}
