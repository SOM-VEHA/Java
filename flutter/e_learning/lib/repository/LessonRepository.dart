import '../model/Lesson.dart';
abstract class LessonRepository {
  Future<List<Lesson>> findAllByCourseId(String courseId);
  Future<Lesson> detail(String id);
}