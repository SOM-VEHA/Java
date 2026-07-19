// import 'package:e_learning/screens/course_screen.dart';
// import 'package:e_learning/widget/CourseCard.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import '../provider/CourseProvider.dart';
// import '../provider/FavoriteProvider.dart';
//
// class CoursePopular extends ConsumerWidget {
//   const CoursePopular({Key? key}) : super(key: key);
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final courses = ref.watch(courseProvider);
//     final favorites = ref.watch(favoriteControllerProvider);
//     final favoriteController = ref.read(favoriteControllerProvider.notifier);
//     return courses.when(
//       loading: () => const SliverToBoxAdapter(
//         child: Center(child: CircularProgressIndicator()),
//       ),
//       error: (error, stack) => SliverToBoxAdapter(child: Center(child: Text(error.toString()))),
//       data: (courseList) => SliverPadding(
//         padding: const EdgeInsets.all(10),
//         sliver: SliverList.builder(
//           itemCount: courseList.length,
//           itemBuilder: (context, index) {
//             final course = courseList[index];
//             final isFavorite = courseList.any((favorite) => favorite.id == course.id);
//             return CourseCard(
//               image: course.image_url,
//               title: course.title,
//               description: course.description,
//               rating: 4.9,
//               students: 3250,
//               price: "\$29.99",
//               isRecommended: true,
//               isFavorite: courseList.any((f) => f.id == course.id),
//               onTap: () {},
//               onFavorite: () => favoriteController.toggleFavorite(course.id),
//             );
//           },
//         ),
//       ),
//     );
//   }
// }
import 'package:e_learning/screens/course_screen.dart';
import 'package:e_learning/widget/CourseCard.dart';
import 'package:e_learning/widget/CourseItem.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../provider/CourseProvider.dart';
import '../provider/FavoriteProvider.dart';

class CoursePopular extends ConsumerWidget {
  const CoursePopular({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final courses = ref.watch(courseProvider);
    return courses.when(
      loading: () => const SliverToBoxAdapter(
        child: Center(child: CircularProgressIndicator()),
      ),
      error: (error, stack) => SliverToBoxAdapter(child: Center(child: Text(error.toString()))),
      data: (courseList) => SliverPadding(
        padding: const EdgeInsets.all(10),
        sliver: SliverList.builder(
          itemCount: courseList.length,
          itemBuilder: (context, index) {
            final course = courseList[index];
            return CourseItem(course: course,);
          },
        ),
      ),
    );
  }
}
