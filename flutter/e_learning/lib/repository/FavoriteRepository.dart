import 'package:e_learning/model/Favorite.dart';

abstract class FavoriteRepository{
  Future<List<Favorite>> findAll();
  Future<void> removeCourse(String courseId);
  Future<void> addCourse(String courseId);
}