import 'package:e_learning/provider/CategoryProvider.dart';
import 'package:e_learning/screens/course_by_category_screen.dart';
import 'package:e_learning/widget/CategoryItem.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
class CategoryScreen extends ConsumerWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final categories = ref.watch(categoryProvider);
    return categories.when(
      loading: () => const SliverToBoxAdapter(
        child: Center(child: CircularProgressIndicator()),
      ),
      error: (error, stack) =>
          SliverToBoxAdapter(child: Center(child: Text(error.toString()))),
      data: (courseList) => SliverPadding(
        padding: EdgeInsetsGeometry.only(left: 20, right: 20, top: 20),
        sliver: SliverGrid.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4, // 4 columns
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 1,
          ),
          itemCount: courseList.length, // 6 items
          itemBuilder: (context, index) {
            final data=courseList[index];
            return CategoryItem(
              title: data.title,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const CourseByCategoryScreen(),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
