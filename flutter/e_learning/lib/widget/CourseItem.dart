import 'package:e_learning/model/Course.dart';
import 'package:e_learning/provider/FavoriteProvider.dart';
import 'package:e_learning/screens/Course_detail_screen.dart' hide Course;
import 'package:e_learning/widget/CourseCard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CourseItem extends ConsumerWidget {
  final Course course;
  const CourseItem({super.key, required this.course});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favoriteState = ref.watch(favoriteControllerProvider);
    final favoriteController = ref.read(favoriteControllerProvider.notifier);
    final isFavorite = favoriteState.value?.any((favorite) => favorite.course_id == course.id,) ?? false;
    return CourseCard(
      image: course.image_url,
      title: course.title,
      description: course.description,
      rating: 4.9,
      students: 3250,
      price: "\$29.99",
      isRecommended: true,
      isFavorite: isFavorite,
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => CourseDetailScreen(id: course.id),
        ),
      ),
      onFavorite: () async {
        print("CLICK FAVORITE ${course.id}");
        await favoriteController.toggleFavorite(course.id);
      },
    );
  }
}
