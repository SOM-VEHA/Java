import 'package:e_learning/provider/FavoriteProvider.dart';
import 'package:e_learning/screens/Course_detail_screen.dart';
import 'package:e_learning/widget/CourseCard.dart';
import 'package:e_learning/widget/CourseItem.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../provider/CourseProvider.dart';
class CourseScreen extends ConsumerStatefulWidget {
  const CourseScreen({super.key});

  @override
  ConsumerState<CourseScreen> createState() => _CourseScreenState();
}
class _CourseScreenState extends ConsumerState<CourseScreen> {
  late final ScrollController _scrollController;
  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels >=
          _scrollController.position.maxScrollExtent - 200) {
        ref.read(courseProvider.notifier).loadMore();
      }
    });
  }
  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    ref.watch(favoriteControllerProvider);
    final courses = ref.watch(courseProvider);
    return Scaffold(
      body: CustomScrollView(
        controller: _scrollController,
        slivers: [
          SliverAppBar(
            pinned: true,
            title: const Text("Courses"),
            centerTitle: false,
            elevation: 0,
            actions: [
              IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
            ],
          ),
          courses.when(
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
