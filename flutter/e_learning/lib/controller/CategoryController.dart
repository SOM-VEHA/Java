import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../model/Category.dart';
import '../repository/CategoryRepository.dart';
import '../repository/impl/CategoryRepositoryImpl.dart';
class CategoryController extends AsyncNotifier<List<Category>> {
  late CategoryRepository categoryRepository;
  @override
  Future<List<Category>> build() async {
    categoryRepository = ref.read(categoryRepositoryProvider);
    return categoryRepository.findAll();
  }
  Future<void> reload() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() => categoryRepository.findAll());
  }
}
