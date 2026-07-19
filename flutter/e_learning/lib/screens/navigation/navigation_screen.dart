import 'package:e_learning/screens/course_screen.dart';
import 'package:e_learning/screens/favorite_screen.dart';
import 'package:e_learning/screens/home_screen.dart';
import 'package:e_learning/screens/profile_screen.dart';
import 'package:flutter/material.dart';

import '../../model/Course.dart';


class Navigation extends StatefulWidget {
  Navigation({super.key});

  @override
  State<Navigation> createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  int _currentIndex = 0;

  final pages = const [
    HomeScreen(),
    CourseScreen(),
    FavoriteScreen(),
    ProfileScreen(),
    // ProfileScreens(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        elevation: 0,

        selectedItemColor: const Color(0xFF2F6BFF),
        unselectedItemColor: Colors.grey,

        selectedFontSize: 11,
        unselectedFontSize: 11,

        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },

        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.menu_book_outlined),
            activeIcon: Icon(Icons.menu_book),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.code),
            label: 'Courses',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorites',
          ),
          // BottomNavigationBarItem(
          //   icon: Icon(Icons.local_fire_department_outlined),
          //   activeIcon: Icon(Icons.local_fire_department),
          //   label: 'Progress',
          // ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            activeIcon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
