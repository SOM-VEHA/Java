import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:icons_plus/icons_plus.dart';

// Assuming you have these models
// class Course { ... }
// class Category { ... }

class HomeDashboard extends StatefulWidget {
  final Function(String) onSelectCourse;
  final Function(String) onResumeLesson;
  final bool isDarkMode;
  final Function(String)? onSearchChange;

  const HomeDashboard({
    super.key,
    required this.onSelectCourse,
    required this.onResumeLesson,
    required this.isDarkMode,
    this.onSearchChange,
  });

  @override
  State<HomeDashboard> createState() => _HomeDashboardState();
}

class _HomeDashboardState extends State<HomeDashboard> {
  String searchQuery = '';
  String? activeCategory;

  @override
  Widget build(BuildContext context) {
    final isDark = widget.isDarkMode;

    // Replace with your actual data
    // final filteredCourses = ... your filtering logic
    // final activeIncomplete = ...
    // final featuredCourse = ...

    return Scaffold(
      backgroundColor: isDark ? const Color(0xFF0A0A0A) : const Color(0xFFF8FAFC),
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            // Header
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 20, 20, 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "WELCOME BACK",
                          style: GoogleFonts.inter(
                            fontSize: 11,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 1.5,
                            color: isDark ? Colors.grey[400] : Colors.grey[600],
                          ),
                        ),
                        Row(
                          children: [
                            Text(
                              "Hello, Alex ",
                              style: GoogleFonts.inter(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                                color: isDark ? Colors.white : Colors.black87,
                              ),
                            ),
                            const Text("👋", style: TextStyle(fontSize: 22))
                                .animate(onComplete: (c) => c.repeat())
                                .shake(duration: 1800.ms),
                          ],
                        ),
                      ],
                    ),
                    // Notification Bell
                    // Stack(
                    //   children: [
                    //     Container(
                    //       padding: const EdgeInsets.all(12),
                    //       decoration: BoxDecoration(
                    //         color: isDark ? const Color(0xFF171717) : Colors.white,
                    //         borderRadius: BorderRadius.circular(16),
                    //         border: Border.all(
                    //           color: isDark ? Colors.grey[800]! : Colors.grey[300]!,
                    //         ),
                    //       ),
                    //       child: const Icon(Bootstrap.bell, size: 24),
                    //     ),
                    //     const Positioned(
                    //       top: 10,
                    //       right: 10,
                    //       child: CircleAvatar(radius: 4, backgroundColor: Colors.purple),
                    //     ),
                    //   ],
                    // ).animate().scaleOnTap(),


                    Stack(
                      children: [
                        GestureDetector(
                          onTap: () {
                            // Add your notification action here
                            print("Notifications tapped");
                          },
                          child: Container(
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: isDark ? const Color(0xFF171717) : Colors.white,
                              borderRadius: BorderRadius.circular(16),
                              border: Border.all(
                                color: isDark ? Colors.grey[800]! : Colors.grey[300]!,
                              ),
                            ),
                            child: const Icon(Bootstrap.bell, size: 24),
                          ).animate().scale(
                            begin: const Offset(1.0, 1.0),
                            end: const Offset(0.95, 0.95),
                            duration: 150.ms,
                            curve: Curves.easeOut,
                          ),
                        ),
                        const Positioned(
                          top: 10,
                          right: 10,
                          child: CircleAvatar(
                            radius: 4,
                            backgroundColor: Colors.purple,
                          ),
                        ),
                        // Optional: Pulsing animation on the badge
                        Positioned(
                          top: 8,
                          right: 8,
                          child: Container(
                            width: 8,
                            height: 8,
                            decoration: BoxDecoration(
                              color: Colors.purple,
                              shape: BoxShape.circle,
                            ),
                          ).animate(onPlay: (controller) => controller.repeat())
                              .scale(begin: const Offset(1, 1), end: const Offset(1.8, 1.8))
                              .fadeIn(duration: 800.ms),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            // Search Bar
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: _buildSearchBar(isDark),
              ),
            ),

            const SliverToBoxAdapter(child: SizedBox(height: 20)),

            // Featured Banner
            if (searchQuery.isEmpty)
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: _buildFeaturedBanner(isDark),
                ),
              ),

            const SliverToBoxAdapter(child: SizedBox(height: 24)),

            // Categories
            SliverToBoxAdapter(
              child: _buildCategoriesSection(isDark),
            ),

            const SliverToBoxAdapter(child: SizedBox(height: 24)),

            // Continue Learning
            if (searchQuery.isEmpty && activeCategory == null /* && activeIncomplete != null */)
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: _buildContinueLearning(isDark),
                ),
              ),

            const SliverToBoxAdapter(child: SizedBox(height: 20)),

            // Courses List
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  activeCategory ?? "Popular Courses",
                  style: GoogleFonts.inter(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: isDark ? Colors.white : Colors.black87,
                  ),
                ),
              ),
            ),

            // Course Cards
            SliverPadding(
              padding: const EdgeInsets.all(20),
              sliver: SliverList(
                delegate: SliverChildBuilderDelegate(
                      (context, index) {
                    // Replace with your filteredCourses.map
                    return _buildCourseCard(
                      // course: filteredCourses[index],
                      isDark: isDark,
                      onTap: () => widget.onSelectCourse("course-id"),
                    );
                  },
                  childCount: 6, // Replace with filteredCourses.length
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSearchBar(bool isDark) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        boxShadow: isDark
            ? null
            : [BoxShadow(color: Colors.black.withOpacity(0.04), blurRadius: 10)],
      ),
      child: TextField(
        onChanged: (val) {
          setState(() => searchQuery = val);
          widget.onSearchChange?.call(val);
        },
        style: GoogleFonts.inter(fontSize: 15),
        decoration: InputDecoration(
          hintText: "Search programming, UX, business...",
          hintStyle: GoogleFonts.inter(color: Colors.grey[500]),
          prefixIcon: const Icon(Icons.search, size: 22),
          suffixIcon: searchQuery.isNotEmpty
              ? TextButton(
            onPressed: () => setState(() => searchQuery = ''),
            child: const Text("CLEAR", style: TextStyle(fontSize: 12)),
          )
              : null,
          filled: true,
          fillColor: isDark ? const Color(0xFF171717) : Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(color: isDark ? Colors.grey[800]! : Colors.grey[300]!),
          ),
          contentPadding: const EdgeInsets.symmetric(vertical: 18),
        ),
      ),
    );
  }

  Widget _buildFeaturedBanner(bool isDark) {
    return GestureDetector(
      onTap: () => widget.onSelectCourse("featured-id"),
      child: Container(
        height: 210,
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [Color(0xFF2563EB), Color(0xFF7C3AED)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(24),
        ),
        child: Stack(
          children: [
            // Decorative circles
            Positioned(right: -40, top: -40, child: CircleAvatar(radius: 70, backgroundColor: Colors.white.withOpacity(0.1))),
            Positioned(left: -20, bottom: -30, child: CircleAvatar(radius: 50, backgroundColor: Colors.purple.withOpacity(0.15))),

            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: const [
                      Chip(label: Text("RECOMMENDED", style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold))),
                      SizedBox(width: 8),
                      Text("✦ Design Track", style: TextStyle(fontSize: 12)),
                    ],
                  ),
                  const Text(
                    "UI/UX Masterclass 2026",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                  const Text(
                    "Master modern interface design with Figma, Framer & Webflow",
                    style: TextStyle(color: Colors.white70, fontSize: 13),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Row(children: [Icon(Icons.timer, size: 16), SizedBox(width: 6), Text("8 weeks")]),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: const Row(
                          children: [
                            Text("Explore", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.indigo)),
                            Icon(Icons.chevron_right, color: Colors.indigo),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ).animate().fadeIn().slideY(begin: 0.1),
    );
  }

  Widget _buildCategoriesSection(bool isDark) {
    // Replace with your CATEGORIES list
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("Explore Categories", style: TextStyle(fontWeight: FontWeight.bold)),
              if (activeCategory != null)
                GestureDetector(
                  onTap: () => setState(() => activeCategory = null),
                  child: const Text("Reset", style: TextStyle(color: Colors.blue)),
                ),
            ],
          ),
        ),
        const SizedBox(height: 12),
        SizedBox(
          height: 110,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            itemCount: 6, // your categories length
            itemBuilder: (context, index) {
              bool isActive = false; // logic here
              return _buildCategoryChip(isActive, isDark);
            },
          ),
        ),
      ],
    );
  }

  Widget _buildCategoryChip(bool isActive, bool isDark) {
    return Container(
      margin: const EdgeInsets.only(right: 12),
      width: 140,
      decoration: BoxDecoration(
        gradient: isActive ? const LinearGradient(colors: [Color(0xFF3B82F6), Color(0xFF8B5CF6)]) : null,
        color: isActive ? null : (isDark ? const Color(0xFF171717) : Colors.white),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: isDark ? Colors.grey[800]! : Colors.grey[200]!),
      ),
      child: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Bootstrap.code, size: 32),
            SizedBox(height: 6),
            Text("Programming", style: TextStyle(fontWeight: FontWeight.w600)),
          ],
        ),
      ),
    );
  }

  Widget _buildContinueLearning(bool isDark) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: isDark ? const Color(0xFF171717) : Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: isDark ? Colors.grey[800]! : Colors.grey[200]!),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Continue Learning", style: TextStyle(fontWeight: FontWeight.bold)),
                const SizedBox(height: 8),
                // Add course title, progress, etc.
                const LinearProgressIndicator(value: 0.65, minHeight: 6),
              ],
            ),
          ),
          const CircleAvatar(
            radius: 26,
            backgroundColor: Color(0xFF3B82F6),
            child: Icon(Icons.play_arrow_rounded, color: Colors.white),
          ),
        ],
      ),
    );
  }

  Widget _buildCourseCard({required bool isDark, required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(12),
        margin: const EdgeInsets.only(bottom: 16),
        decoration: BoxDecoration(
          color: isDark ? const Color(0xFF171717) : Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: isDark ? Colors.grey[800]! : Colors.grey[200]!),
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.network(
                "https://picsum.photos/120/120",
                width: 80,
                height: 80,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Advanced Flutter Development", style: TextStyle(fontWeight: FontWeight.bold)),
                  const SizedBox(height: 6),
                  Row(
                    children: const [
                      Icon(Icons.star, color: Colors.amber, size: 16),
                      Text(" 4.9 "),
                    ],
                  ),
                  const SizedBox(height: 8),
                  const Text("12 weeks • 68% progress", style: TextStyle(fontSize: 12)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}