import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../model/Category.dart';
import '../repository/CategoryRepository.dart';
import '../repository/impl/CategoryRepositoryImpl.dart';
class CategoryController extends AsyncNotifier<List<Category>> {
  CategoryRepository get repository => ref.read(categoryRepositoryProvider);
  @override
  Future<List<Category>> build() async {
    return repository.findAll();
  }
  Future<void> reload() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() => repository.findAll());
  }
}
