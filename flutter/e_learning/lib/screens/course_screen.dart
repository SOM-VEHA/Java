import 'package:e_learning/screens/CourseDetailScreen.dart';
import 'package:e_learning/screens/course_by_category_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../provider/CourseProvider.dart';

class CourseScreen extends ConsumerWidget {
  const CourseScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final courses = ref.watch(courseProvider);
    return Scaffold(
      body: CustomScrollView(
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
          SliverPadding(
            padding: const EdgeInsets.all(10),
            sliver: courses.when(
              loading: () => const SliverToBoxAdapter(
                child: Center(child: CircularProgressIndicator()),
              ),
              error: (error, stack) => SliverToBoxAdapter(
                child: Center(child: Text(error.toString())),
              ),
              data: (courseList) => SliverList.builder(
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.08),
                            blurRadius: 10,
                            spreadRadius: 6,
                            offset: const Offset(0, 2),
                          ),
                        ],
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.blue,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 10,
                                        vertical: 5,
                                      ),
                                      decoration: BoxDecoration(
                                        color: Colors.white.withOpacity(.15),
                                        borderRadius: BorderRadius.circular(30),
                                      ),
                                      child: const Text(
                                        "RECOMMENDED",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 10,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 10),
                                    Icon(Icons.align_vertical_bottom, color: Colors.white.withOpacity(.8), size: 18),
                                    const SizedBox(width: 10),
                                    Text(
                                      "Flutter",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const SizedBox(width: 10),

                                  ],
                                ),
                                Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(5.0),
                                      child: Icon(Icons.favorite_border,color: Colors.black,),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(height: 10),
                            Text(
                              "Build beautiful cross-platform mobile applications.",
                              style: TextStyle(
                                // color: Colors.white.withOpacity(.10),
                                color: Colors.white,
                                fontSize: 15,
                              ),
                            ),
                            SizedBox(height: 10),
                            Text(
                              "Build beautiful cross-platform mobile applications.Build beautiful cross-platform mobile applications.",
                              style: TextStyle(
                                // color: Colors.white.withOpacity(.10),
                                color: Colors.white,
                                fontSize: 10,
                              ),
                            ),
                            SizedBox(height: 20),
                            Row(
                              children: [
                                Icon(
                                  Icons.schedule,
                                  size: 18,
                                  color: Colors.white,
                                ),
                                SizedBox(width: 6),
                                Text(
                                  "8h 30m",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 10,
                                  ),
                                ),
                                Spacer(),
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.white,
                                    foregroundColor: Colors.deepPurple,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                    elevation: 0,
                                  ),
                                  onPressed: () =>Navigator.push(context, MaterialPageRoute(builder: (context)=>CourseDetailScreen())),
                                  child: const Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text("Explore"),
                                      SizedBox(width: 4),
                                      Icon(Icons.arrow_forward_ios, size: 14),
                                    ],
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
