import 'package:e_learning/core/constants/supabase_constants.dart';
import 'package:e_learning/core/network/supabase_client.dart';
import 'package:e_learning/model/Lesson.dart';
import 'package:e_learning/repository/LessonRepository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LessonRepositoryImpl implements LessonRepository {
  final SupabaseService service;

  LessonRepositoryImpl(this.service);

  @override
  Future<Lesson> detail(String id) async {
    final response=await service.selectById(BaseConstants.lessonTable, "id", id);
    print(response);
    return Lesson.fromJson(response);
  }

  @override
  Future<List<Lesson>> findAllByCourseId(String courseId) async {
    final response = await service.selectByColumn(BaseConstants.lessonTable, "course_id", courseId);
    print(response);
    return response.map((toElement) => Lesson.fromJson(toElement)).toList();
  }
}

final lessonRepositoryProvider = Provider<LessonRepository>((ref) {
  final service = ref.watch(supabaseServiceProvider);
  return LessonRepositoryImpl(service);
});