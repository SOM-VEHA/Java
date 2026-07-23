import 'package:e_learning/base/BaseState.dart';
import '../../../model/Lesson.dart';
class LessonListState extends BaseState {
  final List<Lesson> lessons;
  const LessonListState({this.lessons = const [], super.isLoading, super.error});
  LessonListState copyWith({List<Lesson>? lessons,bool? isLoading, String? error,bool clearError = false,}) {
    return LessonListState(
      lessons: lessons ?? this.lessons,
      isLoading: isLoading ?? this.isLoading,
      error: clearError ? null : error ?? this.error,
    );
  }
}