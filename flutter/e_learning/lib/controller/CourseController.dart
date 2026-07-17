import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../model/Course.dart';
import '../repository/CourseRepository.dart';
import '../repository/impl/CourseRepositoryImpl.dart';
class CourseController extends AsyncNotifier<List<Course>> {
  CourseRepository get repository => ref.read(courseRepositoryProvider);
  @override
  FutureOr<List<Course>> build() {
    return repository.findAll();
  }

  Future<void> fetchCourses() async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() =>repository.findAll());
  }

  Future<Course> findById(String id) async {
    return repository.findById(id);
  }
}
