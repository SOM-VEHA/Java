// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import '../../model/Course.dart';
// import '../../repository/CourseRepository.dart';
// import '../../repository/impl/CourseRepositoryImpl.dart';
// class CourseCategoriesController extends FutureProvider.family<List<Course>> {
//   CourseRepository get repository => ref.read(courseRepositoryProvider);
//   late String categoryId;
//   int _page = 1;
//   final int _limit = 10;
//   bool _hasMore = true;
//   bool _isLoadingMore = false;
//
//   @override
//   Future<List<Course>> build() async {
//     final courses = await repository.findByCategoryId(categoryId, page: _page, limit: _limit);
//     _hasMore = courses.length == _limit;
//     return courses;
//   }
//
//   Future<void> loadMore() async {
//     if (_isLoadingMore || !_hasMore) return;
//     _isLoadingMore = true;
//     _page++;
//     try {
//       final newCourses = await repository.findByCategoryId(categoryId,page: _page, limit: _limit);
//       if (newCourses.length < _limit) {
//         _hasMore = false;
//       }
//       state = AsyncData([...state.value ?? [], ...newCourses]);
//     } finally {
//       _isLoadingMore = false;
//     }
//   }
//
//   Future<void> setCategory(String id) async {
//     categoryId = id;
//     _page = 1;
//     state = const AsyncLoading();
//     final courses = await repository.findByCategoryId(id, page: _page, limit: _limit,);
//     state = AsyncData(courses);
//   }
// }
