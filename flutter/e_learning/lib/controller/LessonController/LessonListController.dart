import 'package:e_learning/controller/state/LessonState/LessonListState.dart';
import 'package:e_learning/repository/LessonRepository.dart';
import 'package:e_learning/repository/impl/LessonRepositoryImpl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
class LessonListController extends Notifier<LessonListState> {

  LessonRepository get repository => ref.read(lessonRepositoryProvider);

  @override
  LessonListState build() {
    return const LessonListState();
  }

  Future<void> loadLessons(String courseId) async {
    state = state.copyWith(isLoading: true);
    try {
      final data = await repository.findAllByCourseId(courseId);
      state = state.copyWith(lessons: data, isLoading: false,clearError: true,);
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
    }
  }
}
