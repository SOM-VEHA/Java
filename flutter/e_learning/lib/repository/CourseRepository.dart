import '../model/Course.dart';
abstract class CourseRepository{
  Future<List<Course>> findAll();
  Future<Course> findById(String id);
}