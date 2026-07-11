import 'package:e_learning/model/Category.dart';
abstract class CategoryRepository{
  Future<List<Category>> findAll();
}