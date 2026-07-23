import 'package:e_learning/controller/CourseController/course_popular_controller.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../controller/CourseController/course_controller.dart';
import '../model/Course.dart';
import '../repository/impl/CourseRepositoryImpl.dart';
final courseProvider=AsyncNotifierProvider<CourseController,List<Course>>(CourseController.new);
final coursePopularProvider=AsyncNotifierProvider<CoursePopularController,List<Course>>(CoursePopularController.new);
final courseByIdProvider = FutureProvider.family<Course, String>((ref, id)=>ref.read(courseRepositoryProvider).findById(id));
final coursesByCategoryProvider = FutureProvider.family<List<Course>, String>((ref, categoryId)=>ref.read(courseRepositoryProvider).findByCategoryId(categoryId));