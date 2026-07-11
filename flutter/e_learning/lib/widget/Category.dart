// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
//
//
// class Banner extends StatelessWidget {
//   const Banner({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold();
//   }
// }

import 'package:e_learning/provider/CategoryProvider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../provider/BannerProvider.dart';
class CategoryPage extends ConsumerWidget {
  const CategoryPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final categories = ref.watch(categoryProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Category Test"),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              ref.read(categoryProvider.notifier).reload();
            },
          )
        ],
      ),

      body: categories.when(
        loading: () {
          return const Center(
            child: CircularProgressIndicator(),
          );
        },

        error: (error, stack) {
          return Center(
            child: Text(
              "Error: $error",
            ),
          );
        },

        data: (list) {
          if (list.isEmpty) {
            return const Center(
              child: Text("No Category found"),
            );
          }

          return ListView.builder(
            itemCount: list.length,
            itemBuilder: (context, index) {
              final banner = list[index];

              return Card(
                child: ListTile(
                  title: Text(
                    banner.title ?? "No title",
                  ),
                  subtitle: Text(
                    banner.description,
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}