import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../controller/CourseController.dart';
import '../model/Course.dart';
final courseProvider=AsyncNotifierProvider<CourseController,List<Course>>(CourseController.new);
// final categoryProvider = AsyncNotifierProvider<CategoryController, List<Category>>(CategoryController.new);