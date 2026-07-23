import 'package:e_learning/screens/Course_screen.dart';
import 'package:e_learning/screens/Favorite_screen.dart';
import 'package:e_learning/screens/Home_screen.dart';
import 'package:e_learning/screens/Profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../model/Course.dart';
import '../../provider/FavoriteProvider.dart';
class Navigation extends ConsumerStatefulWidget {
  const Navigation({super.key});

  @override
  ConsumerState<Navigation> createState() => _NavigationState();
}

class _NavigationState extends ConsumerState<Navigation> {
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
    ref.watch(favoriteControllerProvider);
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: pages,
      ),
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
