import 'package:flutter/material.dart';

class Course {
  final String title;
  final String instructor;

  Course({
    required this.title,
    required this.instructor,
  });
}

class AnimatedCourseListPage extends StatelessWidget {
  AnimatedCourseListPage({super.key});

  final List<Course> courses = [
    Course(title: "Flutter Basics", instructor: "John Doe"),
    Course(title: "Laravel API", instructor: "Jane Smith"),
    Course(title: "React Fundamentals", instructor: "David Lee"),
    Course(title: "UI/UX Design", instructor: "Sarah Kim"),
    Course(title: "Python Beginner", instructor: "Alex Chen"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Courses")),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: courses.length,
        itemBuilder: (context, index) {
          final course = courses[index];

          return TweenAnimationBuilder<double>(
            duration: Duration(milliseconds: 300 + index * 100),
            tween: Tween(begin: 0, end: 1),
            builder: (context, value, child) {
              return Opacity(
                opacity: value,
                child: Transform.translate(
                  offset: Offset(0, 30 * (1 - value)),
                  child: child,
                ),
              );
            },
            child: Card(
              margin: const EdgeInsets.only(bottom: 12),
              child: ListTile(
                leading: const CircleAvatar(
                  child: Icon(Icons.school),
                ),
                title: Text(course.title),
                subtitle: Text(course.instructor),
                trailing: const Icon(Icons.arrow_forward_ios, size: 16),
              ),
            ),
          );
        },
      ),
    );
  }
}