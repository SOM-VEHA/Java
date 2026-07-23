import '../model/Course.dart';
abstract class CourseRepository{
  Future<List<Course>> findAll({int page = 1, int limit = 10});
  Future<List<Course>> findAllByPopular();
  Future<List<Course>> findByCategoryId(String categoryId);
  Future<List<Course>> search(String keyword);
  Future<Course> findById(String id);
}