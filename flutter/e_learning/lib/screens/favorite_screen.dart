import 'package:e_learning/widget/CourseItem.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../provider/FavoriteProvider.dart';

class FavoriteScreen extends ConsumerWidget {
  const FavoriteScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favoriteProvider = ref.watch(favoriteControllerProvider);
    final favorites = favoriteProvider.value ?? [];
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            floating: false,
            snap: false,
            backgroundColor: Colors.white,
            surfaceTintColor: Colors.transparent,
            elevation: 0,
            centerTitle: false,
            title: const Text(
              'Favorites',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color: Colors.black87,
                letterSpacing: 0.3,
              ),
            ),
            actions: [Icon(Icons.notifications)],
          ),
          SliverPadding(
            padding: const EdgeInsets.all(10),
            sliver: favorites.isEmpty
                ? const SliverFillRemaining(
                    hasScrollBody: false,
                    child: Center(
                      child: Text(
                        "No favorite courses",
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  )
                : SliverList.builder(
                    itemCount: favorites.length,
                    itemBuilder: (context, index) {
                      final favorite = favorites[index];

                      return CourseItem(course: favorite.course);
                    },
                  ),
          ),
          // SliverPadding(
          //   padding: EdgeInsetsGeometry.all(10),
          //   sliver:favoriteProvider.when(
          //     loading: () => SliverFillRemaining(
          //       child: const Center(child: CircularProgressIndicator()),
          //     ),
          //     error: (error, stack) => SliverToBoxAdapter(
          //       child: Center(child: Text(error.toString())),
          //     ),
          //     data: (favorites) {
          //       if (favorites.isEmpty) {
          //         return const SliverFillRemaining(
          //           hasScrollBody: false,
          //           child: Center(
          //             child: Text(
          //               "No favorite courses",
          //               style: TextStyle(fontSize: 16),
          //             ),
          //           ),
          //         );
          //       }
          //       return  SliverList.builder(
          //         itemCount: favorites.length,
          //         itemBuilder: (context, index) {
          //           final course=favorites[index];
          //           return CourseItem(course: course.course);
          //         },
          //       );
          //     },
          //   ),
          // ),
        ],
      ),
    );
  }
}
