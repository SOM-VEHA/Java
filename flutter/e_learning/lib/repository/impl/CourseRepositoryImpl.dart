import 'package:e_learning/core/supabase_client.dart';
import 'package:e_learning/model/Course.dart';
import 'package:e_learning/repository/CourseRepository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CourseRepositoryImpl implements CourseRepository{
  final SupabaseService supabase;
  CourseRepositoryImpl(this.supabase);
  @override
  Future<List<Course>> findAll()async {
    final response=await supabase.select("course");
    return response.map((e) => Course.fromJson(e)).toList();
  }
}
final courseRepositoryProvider=Provider<CourseRepository>((ref){
  final service=ref.watch(supabaseServiceProvider);
  return CourseRepositoryImpl(service);
});