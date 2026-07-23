import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../model/course.dart';
import '../provider/SearchProvider.dart';
class CourseSearchScreen extends ConsumerWidget {
  const CourseSearchScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final searchState = ref.watch(searchProvider);
    return Scaffold(
      appBar: AppBar(title: const Text("Search Course")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              decoration: const InputDecoration(
                hintText: "Search course...",
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                ref.read(searchProvider.notifier).search(value);
              },
            ),
            const SizedBox(height: 20),
            Expanded(
              child: Builder(
                builder: (context) {
                  // Loading
                  if (searchState.isLoading) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  // Error
                  if (searchState.error != null) {
                    return Center(child: Text(searchState.error!));
                  }
                  // Empty
                  if (searchState.results.isEmpty) {
                    return const Center(child: Text("No course found"));
                  }
                  // Result List
                  return ListView.builder(
                    itemCount: searchState.results.length,
                    itemBuilder: (context, index) {
                      final course = searchState.results[index];
                      return Card(
                        child: ListTile(
                          leading: const Icon(Icons.play_circle),
                          title: Text(course.title),
                          subtitle: Text(
                            course.description ?? "",
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
