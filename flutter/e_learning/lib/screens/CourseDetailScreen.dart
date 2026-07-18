import 'package:e_learning/widget/LessonScreen.dart';
import 'package:flutter/material.dart';
import 'course_detail_screen.dart';
class CourseDetailScreen extends StatelessWidget {
  CourseDetailScreen({Key? key}) : super(key: key);
  final Course course = Course(
    title: "Flutter Complete Course",
    lessons: [
      Lesson(title: "Introduction to Flutter", duration: "08:30"),
      Lesson(title: "Installing Flutter SDK", duration: "12:45"),
      Lesson(title: "Creating Your First App", duration: "15:20"),
      Lesson(title: "Widgets Explained", duration: "18:10"),
      Lesson(title: "Stateless vs Stateful Widgets", duration: "20:05"),
      Lesson(title: "Layouts with Row & Column", duration: "16:50"),
      Lesson(title: "ListView & GridView", duration: "14:15"),
      Lesson(title: "Navigation Between Screens", duration: "11:30"),
      Lesson(title: "Using Forms & Validation", duration: "17:40"),
      Lesson(title: "State Management Basics", duration: "22:10"),
      Lesson(title: "HTTP API Integration", duration: "25:35"),
      Lesson(title: "Local Storage (SharedPreferences)", duration: "13:20"),
      Lesson(title: "SQLite Database", duration: "24:15"),
      Lesson(title: "Firebase Authentication", duration: "19:55"),
      Lesson(title: "Supabase Authentication", duration: "18:40"),
      Lesson(title: "Publishing Flutter App", duration: "21:10"),
    ],
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            leading: IconButton(
              onPressed: () => Navigator.pop(context),
              icon: Icon(Icons.arrow_back_ios),
            ),
            expandedHeight: 250,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.network(
                "https://imgs.search.brave.com/ACedRZHztn-OEwyhM1B15tdkWFNDmr_vu6lbM9Pyr10/rs:fit:500:0:1:0/g:ce/aHR0cHM6Ly9jZG4t/ZnJvbnQuZnJlZXBp/ay5jb20vaG9tZS9h/bm9uLXJ2bXAvY3Jl/YXRpdmUtc3VpdGUv/cGhvdG9ncmFwaHkv/cmVpbWFnaW5lLndl/YnA",
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    course.title,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      const Icon(Icons.star, color: Colors.amber, size: 20),
                      const SizedBox(width: 4),
                      Text(
                        '5',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(width: 16),
                      const Icon(Icons.person, color: Colors.grey, size: 20),
                      const SizedBox(width: 4),
                      Text(
                        "jahkfjjalijfla",
                        style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  const Text(
                    'About this course',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'This comprehensive course will take you from the basics to advanced concepts. You will work on real-world projects and gain practical skills that are in high demand in the industry.',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black87,
                      height: 1.5,
                    ),
                  ),
                ],
              ),
            ),
          ),
          // SliverList(
          //   delegate: SliverChildBuilderDelegate((context, index) {
          //     final lesson = course.lessons[index];
          //     return ListTile(
          //       leading: CircleAvatar(
          //         backgroundColor: Theme.of(
          //           context,
          //         ).primaryColor.withOpacity(0.1),
          //         child: Text(
          //           '${index + 1}',
          //           style: TextStyle(color: Theme.of(context).primaryColor),
          //         ),
          //       ),
          //       title: Text(
          //         lesson.title,
          //         style: const TextStyle(fontWeight: FontWeight.w500),
          //       ),
          //       subtitle: Text(lesson.duration),
          //       trailing: const Icon(
          //         Icons.play_circle_outline,
          //         color: Colors.blue,
          //       ),
          //       onTap: () {
          //         print('object');
          //         Navigator.push(
          //           context,
          //           MaterialPageRoute(
          //             builder: (context) => YoutubeScreen(),
          //           ),
          //         );
          //       },
          //     );
          //   }, childCount: course.lessons.length),
          // ),
          SliverPadding(
            padding: EdgeInsetsGeometry.only(left: 20, right: 20),
            sliver: SliverToBoxAdapter(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Lesson",
                    style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),
                  ),
                  Text(
                    "2 / 4 Completed",
                    style: const TextStyle(fontSize: 15, color: Colors.grey),
                  ),
                ],
              ),
            ),
          ),
          LessonScreen(),
        ],
      ),
    );
  }
}
