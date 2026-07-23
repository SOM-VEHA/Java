import 'package:e_learning/core/constants/supabase_constants.dart';
import 'package:e_learning/core/network/supabase_client.dart';
import 'package:e_learning/model/Course.dart';
import 'package:e_learning/repository/CourseRepository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CourseRepositoryImpl implements CourseRepository {
  final SupabaseService service;

  CourseRepositoryImpl(this.service);

  @override
  Future<List<Course>> findAll({int page = 1, int limit = 10}) async {
    final response = await service.select(BaseConstants.courseTable,page: page,limit: limit);
    return response.map((e) => Course.fromJson(e)).toList();
  }

  @override
  Future<Course> findById(String id) async {
    final response = await service.selectById(BaseConstants.courseTable,"id",id);
    return Course.fromJson(response);
  }

  @override
  Future<List<Course>> findByCategoryId(String categoryId) async {
    final response = await service.selectByColumn(BaseConstants.courseTable, "category_id", categoryId);
    return response.map((e) => Course.fromJson(e)).toList();
  }

  @override
  Future<List<Course>> findAllByPopular() async {
    final response = await service.selectByColumn(BaseConstants.courseTable,"is_popular", true);
    return response.map((e) => Course.fromJson(e)).toList();
  }

  @override
  Future<List<Course>> search(String keyword) async {
    final value = keyword.trim();
    if (value.isEmpty) {
      return [];
    } else {
      final response = await service.search(BaseConstants.courseTable, value);
      return response.map((e) => Course.fromJson(e)).toList();
    }
  }
}

final courseRepositoryProvider = Provider<CourseRepository>((ref) {
  final service = ref.watch(supabaseServiceProvider);
  return CourseRepositoryImpl(service);
});
