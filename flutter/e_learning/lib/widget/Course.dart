
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../provider/CourseProvider.dart';
import '../screens/Course_detail_screen.dart';

class CourseScreens extends ConsumerWidget {
  const CourseScreens({super.key});

  @override
  // Widget build(BuildContext context, WidgetRef ref) {
  //   final courses=ref.watch(courseProvider);
  //   return SliverPadding(
  //     padding: const EdgeInsets.all(10),
  //     sliver: SliverList.builder(itemBuilder: (context, index) {
  //       return Container(
  //         decoration: BoxDecoration(
  //           borderRadius: BorderRadius.circular(10),
  //           color: Colors.red,
  //         ),
  //         margin: EdgeInsets.all(10),
  //         height: 200,
  //       );
  //     },)
  //   );
  // }
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final courses = ref.watch(courseProvider);
    return


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
            return InkWell(
              onTap: (){
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder: (context) =>  CourseDetailScreen(),
                //   ),
                // );
              },
              child: Container(
                margin: const EdgeInsets.all(10),
                padding: const EdgeInsets.all(10),
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
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                      child: Image.network(
                        "https://imgs.search.brave.com/ACedRZHztn-OEwyhM1B15tdkWFNDmr_vu6lbM9Pyr10/rs:fit:500:0:1:0/g:ce/aHR0cHM6Ly9jZG4t/ZnJvbnQuZnJlZXBp/ay5jb20vaG9tZS9h/bm9uLXJ2bXAvY3Jl/YXRpdmUtc3VpdGUv/cGhvdG9ncmFwaHkv/cmVpbWFnaW5lLndl/YnA",
                        height: 100,
                        width: 100,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            course.title,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            course.description,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(height: 5),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  const Icon(
                                    Icons.star,
                                    color: Colors.orange,
                                    size: 18,
                                  ),
                                  const SizedBox(width: 4),
                                  Text(
                                    course.rating,
                                    style: const TextStyle(
                                      color: Colors.orange,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(width: 4),
                                  Text(
                                    "(${course.rating})",
                                    style: const TextStyle(color: Colors.grey),
                                  ),
                                ],
                              ),
                              Text(
                                "100% In Progress",
                                style: const TextStyle(color: Colors.blue, fontSize: 12,fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
