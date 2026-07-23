import 'package:e_learning/controller/state/LessonState/LessonDetailState.dart';
import 'package:e_learning/repository/LessonRepository.dart';
import 'package:e_learning/repository/impl/LessonRepositoryImpl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LessonDetailController extends Notifier<LessonDetailState> {
  LessonRepository get repository => ref.read(lessonRepositoryProvider);

  @override
  LessonDetailState build() {
    return const LessonDetailState();
  }

  Future<void> loadDetail(String id) async {
    state = state.copyWith(isLoading: true);
    try {
      final data = await repository.detail(id);
      state = state.copyWith(lesson: data, isLoading: false);
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
    }
  }
}
