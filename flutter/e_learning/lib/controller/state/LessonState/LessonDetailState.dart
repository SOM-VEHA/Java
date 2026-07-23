import 'package:e_learning/base/BaseState.dart';

import '../../../model/Lesson.dart';
class LessonDetailState extends BaseState {
  final Lesson? lesson;
  const LessonDetailState({this.lesson, super.isLoading, super.error});
  LessonDetailState copyWith({Lesson? lesson, bool? isLoading, String? error}) {
    return LessonDetailState(
      lesson: lesson ?? this.lesson,
      isLoading: isLoading ?? this.isLoading,
      error: error,
    );
  }
}
