import 'package:e_learning/core/constants/supabase_constants.dart';
import 'package:e_learning/core/network/supabase_client.dart';
import 'package:e_learning/model/Course.dart';
import 'package:e_learning/repository/CourseRepository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CourseRepositoryImpl implements CourseRepository {
  final SupabaseService supabase;
  CourseRepositoryImpl(this.supabase);
  @override
  Future<List<Course>> findAll() async {
    final response = await supabase.select(BaseConstants.courseTable);
    return response.map((e) => Course.fromJson(e)).toList();
  }

  @override
  Future<Course> findById(String id) async {
    final response = await supabase.selectById(BaseConstants.courseTable, "id", id);
    return Course.fromJson(response);
  }
}

final courseRepositoryProvider = Provider<CourseRepository>((ref) {
  final service = ref.watch(supabaseServiceProvider);
  return CourseRepositoryImpl(service);
});
