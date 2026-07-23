import 'package:e_learning/widget/CourseItem.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../provider/FavoriteProvider.dart';
class FavoriteScreen extends ConsumerStatefulWidget {
  const FavoriteScreen({super.key});

  @override
  ConsumerState<FavoriteScreen> createState() => _FavoriteScreenState();
}
class _FavoriteScreenState extends ConsumerState<FavoriteScreen> {
  @override
  Widget build(BuildContext context) {
    final favoriteProvider = ref.watch(favoriteControllerProvider);
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        // controller: _scrollController,
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
          favoriteProvider.when(
            loading: () => const SliverFillRemaining(
              child: Center(child: CircularProgressIndicator()),
            ),
            error: (e, _) => SliverFillRemaining(
              child: Center(child: Text(e.toString())),
            ),
            data: (favorites) {
              if (favorites.isEmpty) {
                return const SliverFillRemaining(
                  hasScrollBody: false,
                  child: Center(
                    child: Text("No favorite courses"),
                  ),
                );
              }
              return SliverPadding(
                padding: const EdgeInsets.all(10),
                sliver: SliverList.builder(
                  itemCount: favorites.length,
                  itemBuilder: (context, index) {
                    return CourseItem(
                      course: favorites[index].course,
                    );
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
