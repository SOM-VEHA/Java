import 'package:e_learning/base/BaseState.dart';
import 'package:e_learning/model/Course.dart';
class SearchState extends BaseState {
  final String keyword;
  final List<Course> results;
  SearchState({
    this.keyword = '',
    this.results = const [],
    super.isLoading,
    super.error,
  });
  SearchState copyWith({
    String? keyword,
    List<Course>? results,
    bool? isLoading,
    String? error,
    bool clearError = false
  }) {
    return SearchState(
      keyword: keyword ?? this.keyword,
      results: results ?? this.results,
      isLoading: isLoading ?? this.isLoading,
      error: clearError ? null : error ?? this.error,
    );
  }
}