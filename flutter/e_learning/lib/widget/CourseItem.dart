import 'package:e_learning/model/Course.dart';
import 'package:e_learning/provider/FavoriteProvider.dart';
import 'package:e_learning/screens/CourseDetailScreen.dart';
import 'package:e_learning/widget/CourseCard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CourseItem extends ConsumerWidget {
  final Course course;
  const CourseItem({super.key, required this.course});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favoriteList = ref.watch(favoriteControllerProvider).value ?? [];
    final favoriteController = ref.read(favoriteControllerProvider.notifier);
    final isFavorite = favoriteList.any(
      (favorite) => favorite.course_id == course.id,
    );

    return CourseCard(
      image: course.image_url,
      title: course.title,
      description: course.description,
      rating: 4.9,
      students: 3250,
      price: "\$29.99",
      isRecommended: true,
      isFavorite: isFavorite,
      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => CourseDetailScreen())),
      onFavorite: () {
        favoriteController.toggleFavorite(course.id);
      },
    );
  }
}
