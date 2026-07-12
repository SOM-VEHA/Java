import 'package:e_learning/widget/Banner.dart';
import 'package:e_learning/widget/Category.dart';
import 'package:e_learning/widget/Course.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: const Text("Navigation"),
            centerTitle: true,
            pinned: true,
            actions: [
              IconButton(onPressed: () {}, icon: Icon(Icons.notifications)),
            ],
          ),
          BannerScreen(),
          SliverPadding(
            padding: EdgeInsetsGeometry.only(left: 10, right: 10, top: 10),
            sliver: SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
                child: Text(
                  "Explore Categories",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
          CategoryScreen(),
          SliverPadding(
            padding: EdgeInsetsGeometry.only(left: 10, right: 10, top: 10),
            sliver: SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
                child: Text(
                  "Popular Course",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
          CourseScreen(),
        ],
      ),
    );
  }
}
