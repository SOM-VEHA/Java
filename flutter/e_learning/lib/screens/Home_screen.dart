import 'package:e_learning/screens/Notification_screen.dart';
import 'package:e_learning/widget/Banner.dart';
import 'package:e_learning/widget/Category.dart';
import 'package:flutter/material.dart';
import 'Course_popular_screen.dart';
import 'Search_screen.dart';
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.white,
            title: const Text("Programing E-Learning",),
            centerTitle: false,
            elevation: 0,
            pinned: true,
            actions: [
              IconButton(onPressed: () =>Navigator.push(context, MaterialPageRoute(builder: (context)=>NotificationScreen())), icon: Icon(Icons.notifications)),
            ],
          ),
          SliverPadding(
            padding: EdgeInsetsGeometry.only(left: 20, right: 20, top: 10),
            sliver: SliverToBoxAdapter(
              child: InkWell(
                onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>Searchscreen())),
                child: Container(
                  padding: EdgeInsetsGeometry.all(15),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(18),
                    color: Colors.white,
                    // border: Border.all(color: Colors.blueGrey),
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
                      Icon(Icons.search, color: Colors.grey),
                      SizedBox(width: 10),
                      Text(
                        "Search programing language",
                        style: TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                ),
              ),
            ),
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
                  "Explore Categories",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
          BannerScreen(),
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
          CoursePopular(),
        ],
      ),
    );
  }
}
