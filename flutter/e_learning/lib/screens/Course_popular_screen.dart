import 'package:e_learning/widget/CourseItem.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../provider/CourseProvider.dart';
class CoursePopular extends ConsumerWidget {
  const CoursePopular({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final courses = ref.watch(coursePopularProvider);
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
