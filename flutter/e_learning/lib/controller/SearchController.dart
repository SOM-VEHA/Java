import 'package:e_learning/controller/state/SearchState/SearchState.dart';
import 'package:e_learning/repository/CourseRepository.dart';
import 'package:e_learning/repository/impl/CourseRepositoryImpl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
class SearchController extends Notifier<SearchState> {

  CourseRepository get repository => ref.read(courseRepositoryProvider);

  @override
  SearchState build() {
    return  SearchState();
  }

  Future<void> search(String keyword) async {
    state = state.copyWith(keyword: keyword, isLoading: true);
    try {
      final courses = await repository.search(keyword);
      state = state.copyWith(results: courses, isLoading: false,clearError: true);
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
    }
  }
}
