import '../model/Course.dart';
abstract class CourseRepository{
  Future<List<Course>> findAll();
}