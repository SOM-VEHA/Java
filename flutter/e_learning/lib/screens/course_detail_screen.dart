// import 'package:flutter/material.dart';
// import '../model/Course.dart';
//
// class CourseDetailScreen extends StatelessWidget {
//   final Course course;
//
//   const CourseDetailScreen({super.key, required this.course});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: CustomScrollView(
//         slivers: [
//           SliverAppBar(
//             expandedHeight: 250,
//             pinned: true,
//             flexibleSpace: FlexibleSpaceBar(
//               background: Image.network(
//                 course.image,
//                 fit: BoxFit.cover,
//               ),
//             ),
//           ),
//           SliverToBoxAdapter(
//             child: Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     course.title,
//                     style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//                   ),
//                   const SizedBox(height: 8),
//                   Row(
//                     children: [
//                       const Icon(Icons.star, color: Colors.amber, size: 20),
//                       const SizedBox(width: 4),
//                       Text(course.rating, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
//                       const SizedBox(width: 16),
//                       const Icon(Icons.person, color: Colors.grey, size: 20),
//                       const SizedBox(width: 4),
//                       Text(course.instructor, style: const TextStyle(color: Colors.grey, fontSize: 16)),
//                     ],
//                   ),
//                   const SizedBox(height: 24),
//                   const Text(
//                     'About this course',
//                     style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//                   ),
//                   const SizedBox(height: 8),
//                   const Text(
//                     'This comprehensive course will take you from the basics to advanced concepts. You will work on real-world projects and gain practical skills that are in high demand in the industry.',
//                     style: TextStyle(fontSize: 16, color: Colors.black87, height: 1.5),
//                   ),
//                   const SizedBox(height: 24),
//                   const Text(
//                     'Lessons',
//                     style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//                   ),
//                   const SizedBox(height: 16),
//                 ],
//               ),
//             ),
//           ),
//           SliverList(
//             delegate: SliverChildBuilderDelegate(
//               (context, index) {
//                 final lesson = course.lessons[index];
//                 return ListTile(
//                   leading: CircleAvatar(
//                     backgroundColor: Theme.of(context).primaryColor.withOpacity(0.1),
//                     child: Text('${index + 1}', style: TextStyle(color: Theme.of(context).primaryColor)),
//                   ),
//                   title: Text(lesson.title, style: const TextStyle(fontWeight: FontWeight.w500)),
//                   subtitle: Text(lesson.duration),
//                   trailing: const Icon(Icons.play_circle_outline, color: Colors.blue),
//                   onTap: () {
//                     // Start lesson
//                   },
//                 );
//               },
//               childCount: course.lessons.length,
//             ),
//           ),
//           const SliverPadding(padding: EdgeInsets.only(bottom: 80)),
//         ],
//       ),
//       bottomSheet: Container(
//         padding: const EdgeInsets.all(16),
//         decoration: BoxDecoration(
//           color: Colors.white,
//           boxShadow: [
//             BoxShadow(
//               color: Colors.black.withOpacity(0.05),
//               offset: const Offset(0, -4),
//               blurRadius: 10,
//             ),
//           ],
//         ),
//         child: Row(
//           children: [
//             Text(
//               course.price,
//               style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//             ),
//             const SizedBox(width: 24),
//             Expanded(
//               child: ElevatedButton(
//                 onPressed: () {},
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: Theme.of(context).primaryColor,
//                   foregroundColor: Colors.white,
//                   padding: const EdgeInsets.symmetric(vertical: 16),
//                   shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
//                 ),
//                 child: const Text('Enroll Now', style: TextStyle(fontSize: 18)),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
class Lesson {
  final String title;
  final String duration;

  Lesson({
    required this.title,
    required this.duration,
  });
}


class Course {
  final String title;
  final List<Lesson> lessons;

  Course({
    required this.title,
    required this.lessons,
  });
}
