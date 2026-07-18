// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
//
//
// class Banner extends StatelessWidget {
//   const Banner({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold();
//   }
// }

import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_learning/screens/CourseDetailScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../provider/BannerProvider.dart';

class BannerPage extends ConsumerWidget {
  const BannerPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final banners = ref.watch(bannerProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Banner Test"),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              ref.read(bannerProvider.notifier).reload();
            },
          ),
        ],
      ),

      body: banners.when(
        loading: () {
          return const Center(child: CircularProgressIndicator());
        },

        error: (error, stack) {
          return Center(child: Text("Error: $error"));
        },

        data: (list) {
          if (list.isEmpty) {
            return const Center(child: Text("No banner found"));
          }

          return ListView.builder(
            itemCount: list.length,
            itemBuilder: (context, index) {
              final banner = list[index];

              return Card(
                child: ListTile(
                  title: Text(banner.title),
                  subtitle: Text(banner.image),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class SlideAnimationPage extends StatelessWidget {
  SlideAnimationPage({super.key});

  final List<String> courses = [
    "Flutter Basics",
    "Advanced Flutter",
    "Laravel API",
    "React JS",
    "Python for Beginners",
    "UI/UX Design",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Slide Animation")),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: courses.length,
        itemBuilder: (context, index) {
          return TweenAnimationBuilder<Offset>(
            tween: Tween(begin: const Offset(1, 0), end: Offset.zero),
            duration: Duration(milliseconds: 400 + (index * 100)),
            curve: Curves.easeOut,
            builder: (context, offset, child) {
              return Transform.translate(
                offset: Offset(offset.dx * 300, 0),
                child: child,
              );
            },
            child: Card(
              margin: const EdgeInsets.only(bottom: 12),
              elevation: 4,
              child: ListTile(
                leading: const CircleAvatar(child: Icon(Icons.play_lesson)),
                title: Text(courses[index]),
                subtitle: const Text("Free Course"),
                trailing: const Icon(Icons.arrow_forward_ios),
              ),
            ),
          );
        },
      ),
    );
  }
}

class SlideDemo extends StatefulWidget {
  const SlideDemo({super.key});

  @override
  State<SlideDemo> createState() => _SlideDemoState();
}

class _SlideDemoState extends State<SlideDemo> {
  bool show = false;

  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(milliseconds: 300), () {
      setState(() {
        show = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Slide Animation")),
      body: Center(
        child: AnimatedSlide(
          offset: show ? Offset.zero : const Offset(1.5, 0),
          duration: const Duration(milliseconds: 600),
          curve: Curves.easeOut,
          child: Card(
            elevation: 5,
            child: Container(
              width: 300,
              padding: const EdgeInsets.all(20),
              child: const Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.play_circle_fill, size: 60, color: Colors.blue),
                  SizedBox(height: 12),
                  Text(
                    "Flutter Beginner",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Text("Free Course"),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class HomeSlider extends StatefulWidget {
  const HomeSlider({super.key});

  @override
  State<HomeSlider> createState() => _HomeSliderState();
}

class _HomeSliderState extends State<HomeSlider> {
  int currentIndex = 0;

  final List<Map<String, String>> banners = [
    {
      "title": "Flutter",
      "description": "Build beautiful cross-platform mobile applications.",
      "duration": "8h 30m",
      "label": "RECOMMENDED",
    },
    {
      "title": "Laravel",
      "description": "Build REST APIs with Laravel 12.",
      "duration": "12h 15m",
      "label": "POPULAR",
    },
    {
      "title": "React",
      "description": "Learn modern React from beginner to advanced.",
      "duration": "10h 45m",
      "label": "NEW",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              children: [
                CarouselSlider.builder(
                  itemCount: banners.length,

                  options: CarouselOptions(
                    autoPlay: true,
                    enlargeCenterPage: true,
                    viewportFraction: 0.92,

                    autoPlayInterval: const Duration(seconds: 4),

                    onPageChanged: (index, reason) {
                      setState(() {
                        currentIndex = index;
                      });
                    },
                  ),

                  itemBuilder: (context, index, realIndex) {
                    final item = banners[index];

                    return Container(
                      width: double.infinity,
                      margin: const EdgeInsets.symmetric(horizontal: 6),
                      padding: const EdgeInsets.all(22),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(22),
                        gradient: const LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            Color(0xff5B5FF8),
                            Color(0xff7B3FF2),
                            Color(0xffB238F5),
                          ],
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.deepPurple.withOpacity(.25),
                            blurRadius: 15,
                            offset: const Offset(0, 8),
                          ),
                        ],
                      ),

                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          /// Badge
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 5,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(.15),
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: const Text(
                              "RECOMMENDED",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 10,
                              ),
                            ),
                          ),

                          const SizedBox(height: 14),

                          /// Category
                          Text(
                            item["title"]!,
                            style: const TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                          const SizedBox(height: 8),

                          Text(
                            item["title"]!,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                              height: 1.2,
                            ),
                          ),

                          const SizedBox(height: 10),

                          Text(
                            item["description"]!,
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              color: Colors.white.withOpacity(.8),
                              fontSize: 15,
                            ),
                          ),

                          const Spacer(),

                          Row(
                            children: [

                              const Icon(
                                Icons.schedule,
                                size: 18,
                                color: Colors.white,
                              ),

                              const SizedBox(width: 6),

                              const Text(
                                "8h 30m",
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),

                              const Spacer(),

                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.white,
                                  foregroundColor: Colors.deepPurple,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                  elevation: 0,
                                ),
                                onPressed: () {},
                                child: const Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text("Explore"),
                                    SizedBox(width: 4),
                                    Icon(Icons.arrow_forward_ios, size: 14),
                                  ],
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    );
                  },
                ),

                const SizedBox(height: 12),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,

                  children: List.generate(banners.length, (index) {
                    return AnimatedContainer(
                      duration: const Duration(milliseconds: 300),

                      margin: const EdgeInsets.symmetric(horizontal: 4),

                      width: currentIndex == index ? 24 : 8,

                      height: 8,

                      decoration: BoxDecoration(
                        color: currentIndex == index
                            ? Colors.blue
                            : Colors.grey.shade400,

                        borderRadius: BorderRadius.circular(20),
                      ),
                    );
                  }),
                ),
              ],
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey.shade400,
              ),
            ),
          ),
        ],
      )
    );
  }
}
class BannerScreen extends ConsumerWidget {
  const BannerScreen({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final banners=ref.watch(bannerProvider);
    return banners.when(
      loading: () => const SliverToBoxAdapter(
        child: Center(child: CircularProgressIndicator()),
      ),
      error: (error, stack) =>
          SliverToBoxAdapter(child: Center(child: Text(error.toString()))),
      data: (courseList) => SliverPadding(
        padding: EdgeInsetsGeometry.only(left: 20, right: 20, top: 20),
        sliver: SliverToBoxAdapter(
          child: Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.08),
                  blurRadius: 10,
                  spreadRadius: 6,
                  offset: const Offset(0, 2),
                ),
              ],
              borderRadius: BorderRadius.circular(15),
              color: Colors.blue,
            ),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 5,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(.15),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: const Text(
                          "RECOMMENDED",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 10,
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Icon(Icons.align_vertical_bottom, color: Colors.white.withOpacity(.8), size: 18),
                      const SizedBox(width: 10),
                      Expanded(
                        child: const Text(
                          "Flutter",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Build beautiful cross-platform mobile applications.",
                    style: TextStyle(
                      // color: Colors.white.withOpacity(.10),
                      color: Colors.white,
                      fontSize: 15,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Build beautiful cross-platform mobile applications.Build beautiful cross-platform mobile applications.",
                    style: TextStyle(
                      // color: Colors.white.withOpacity(.10),
                      color: Colors.white,
                      fontSize: 10,
                    ),
                  ),
                  SizedBox(height: 20),
                  Row(
                    children: [
                      Icon(
                        Icons.schedule,
                        size: 18,
                        color: Colors.white,
                      ),
                      SizedBox(width: 6),
                      Text(
                        "8h 30m",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                        ),
                      ),
                      Spacer(),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          foregroundColor: Colors.deepPurple,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          elevation: 0,
                        ),
                        onPressed: () =>Navigator.push(context, MaterialPageRoute(builder: (context)=>CourseDetailScreen())),
                        child: const Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text("Explore"),
                            SizedBox(width: 4),
                            Icon(Icons.arrow_forward_ios, size: 14),
                          ],
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
