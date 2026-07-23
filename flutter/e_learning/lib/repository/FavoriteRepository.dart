import 'package:e_learning/model/Favorite.dart';

abstract class FavoriteRepository{
  Future<List<Favorite>> findAll({int page = 1, int limit = 10});
  Future<Favorite> addCourse(String courseId);
  Future<void> removeCourse(String courseId);
}