import 'package:e_learning/screens/AuthScreen.dart';
import 'package:flutter/material.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _controller = PageController();
  int currentPage = 0;

  final List<Map<String, dynamic>> pages = [
    {
      "title": "Curated Expert Tracks",
      "description":
      "Embark on structured visual curricula in programming, UI/UX design, business growth, and international languages.",
      "icon": Icons.code,
    },
    {
      "title": "Interactive Lessons",
      "description":
      "Watch HD lessons, read code notes, and test your knowledge with quizzes.",
      "icon": Icons.play_circle_fill,
    },
    {
      "title": "Accelerate Your Goals",
      "description":
      "Track learning streaks, view analytics, and earn certificates.",
      "icon": Icons.workspace_premium,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            /// Skip
            Padding(
              padding: const EdgeInsets.only(right: 20, top: 10),
              child: Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {
                    // Skip
                  },
                  child: const Text("SKIP"),
                ),
              ),
            ),

            /// Pages
            Expanded(
              child: PageView.builder(
                controller: _controller,
                itemCount: pages.length,
                onPageChanged: (index) {
                  setState(() {
                    currentPage = index;
                  });
                },
                itemBuilder: (context, index) {
                  final item = pages[index];

                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        /// Illustration
                        Container(
                          width: 220,
                          height: 220,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(35),
                            gradient: LinearGradient(
                              colors: [
                                Colors.blue.withOpacity(.08),
                                Colors.purple.withOpacity(.08),
                              ],
                            ),
                          ),
                          child: Icon(
                            item["icon"],
                            size: 110,
                            color: Colors.deepPurple,
                          ),
                        ),

                        const SizedBox(height: 30),

                        /// Badge
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 8),
                          decoration: BoxDecoration(
                            color: Colors.blue.withOpacity(.08),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Text(
                            "Feature ${index + 1} of 3",
                            style: const TextStyle(
                              color: Colors.blue,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),

                        const SizedBox(height: 25),

                        Text(
                          item["title"],
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        const SizedBox(height: 16),

                        Text(
                          item["description"],
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 16,
                            height: 1.5,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),

            /// Bottom
            Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                children: [
                  /// Dots
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      pages.length,
                          (index) => AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        margin: const EdgeInsets.symmetric(horizontal: 4),
                        width: currentPage == index ? 28 : 8,
                        height: 8,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          gradient: currentPage == index
                              ? const LinearGradient(
                            colors: [
                              Colors.blue,
                              Colors.deepPurple,
                            ],
                          )
                              : null,
                          color: currentPage == index
                              ? null
                              : Colors.grey.shade300,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 30),

                  SizedBox(
                    width: double.infinity,
                    height: 55,
                    child: ElevatedButton(
                      onPressed: () {
                        if (currentPage < pages.length - 1) {
                          _controller.nextPage(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.ease,
                          );
                        } else {
                          // Navigate to Home
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => AuthScreen(onSuccess: (){}, isDarkMode: false)),
                          );
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.zero,
                        backgroundColor: Colors.transparent,
                        shadowColor: Colors.transparent,
                      ),
                      child: Ink(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          gradient: const LinearGradient(
                            colors: [
                              Colors.blue,
                              Colors.deepPurple,
                            ],
                          ),
                        ),
                        child: Center(
                          child: Text(
                            currentPage == 2
                                ? "Get Started"
                                : "Next",
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}