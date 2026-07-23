import 'dart:async';
import 'package:e_learning/model/Course.dart';
import 'package:e_learning/repository/CourseRepository.dart';
import 'package:e_learning/repository/impl/CourseRepositoryImpl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
class CoursePopularController extends AsyncNotifier<List<Course>>  {
  CourseRepository get repository => ref.read(courseRepositoryProvider);
  @override
  FutureOr<List<Course>> build() async{
    final Courses=await repository.findAllByPopular();
    return Courses;
  }
}