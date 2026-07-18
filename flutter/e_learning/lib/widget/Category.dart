import 'package:e_learning/provider/CategoryProvider.dart';
import 'package:e_learning/screens/course_by_category_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';



class CategoryPage extends ConsumerWidget {
  const CategoryPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final categories = ref.watch(categoryProvider);

    return Scaffold(
      backgroundColor: const Color(0xFFF7F8FC),
      appBar: AppBar(
        title: const Text("Category Test"),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              ref.read(categoryProvider.notifier).reload();
            },
          ),
        ],
      ),

      body: categories.when(
        loading: () {
          return const Center(child: CircularProgressIndicator());
        },

        error: (error, stack) {
          return Center(child: Text("Error: $error"));
        },

        data: (list) {
          if (list.isEmpty) {
            return const Center(child: Text("No Category found"));
          }

          return ListView.separated(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            itemCount: list.length,
            separatorBuilder: (_, __) => const SizedBox(height: 20),
            itemBuilder: (context, index) {
              final banner = list[index];
              return Container(
                height: 130,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.08),
                      blurRadius: 10,
                      spreadRadius: 6,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Container(
                    child: Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadiusGeometry.circular(15),
                          child: Image.network(
                            "https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?w=150",
                            width: 110,
                            height: 110,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Expanded(
                          child: Container(
                            color: Colors.blue,
                            child: Column(
                              children: [
                                Text(banner.title.toString()),
                                Text(banner.description.toString()),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
              //   },
              // );
              // return Card(
              //   margin: EdgeInsets.all(12),
              //   child: ListTile(
              //     title: Text(
              //       banner.title ?? "No title",
              //     ),
              //     subtitle: Text(
              //       banner.description,
              //     ),
              //   ),
              // );
            },
          );
        },
      ),
    );
  }
}

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
            return InkWell(
              onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>CourseByCategoryScreen())),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.08),
                      blurRadius: 10,
                      spreadRadius: 6,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Center(
                  child: Text(data.title,style: TextStyle(fontSize: 10,fontWeight: FontWeight.bold),),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
