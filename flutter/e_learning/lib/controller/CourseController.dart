import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../model/Course.dart';
import '../repository/CourseRepository.dart';
import '../repository/impl/CourseRepositoryImpl.dart';

class CourseController extends AsyncNotifier<List<Course>> {
  late final CourseRepository repository;
  @override
  FutureOr<List<Course>> build() {
    repository=ref.watch(courseRepositoryProvider);
    return repository.findAll();
  }
  Future<void> fetchCourses() async {
    state = const AsyncValue.loading();
    try {
      final courses = await repository.findAll();
      state = AsyncValue.data(courses);
    } catch (e) {
      state = AsyncValue.error(e, StackTrace.current);
    }
  }
}