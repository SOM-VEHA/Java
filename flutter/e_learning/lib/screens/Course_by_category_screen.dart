import 'package:e_learning/provider/CourseProvider.dart';
import 'package:e_learning/widget/CourseCard.dart';
import 'package:e_learning/widget/CourseItem.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
class CourseByCategoryScreen extends ConsumerStatefulWidget {
  final String categoryId;
  const CourseByCategoryScreen({super.key, required this.categoryId});

  @override
  ConsumerState<CourseByCategoryScreen> createState() => _CourseByCategoryScreenState();
}

class _CourseByCategoryScreenState extends ConsumerState<CourseByCategoryScreen> {
  @override
  Widget build(BuildContext context) {
    final coursesAsync = ref.watch(coursesByCategoryProvider(widget.categoryId));
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'categoryName',
          style: const TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              // Search action
            },
            icon: const Icon(Icons.search, color: Colors.black),
          ),
        ],
      ),
      body: CustomScrollView(
        slivers: [
          coursesAsync.when(
            loading: () => const SliverToBoxAdapter(
              child: Center(child: CircularProgressIndicator()),
            ),
            error: (error, stack) => SliverToBoxAdapter(
              child: Center(child: Text(error.toString())),
            ),
            data: (courseList) => SliverPadding(
              padding: const EdgeInsets.all(10),
              sliver: SliverList.builder(
                itemCount: courseList.length,
                itemBuilder: (context, index) {
                  final course = courseList[index];
                  return CourseItem(course: course);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
