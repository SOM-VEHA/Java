import 'package:e_learning/screens/splash/OnboardingScreen.dart';
import 'package:flutter/material.dart';
class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background
          Container(
            decoration: const BoxDecoration(
              color: Colors.white,
            ),
          ),

          // Top Left Glow
          Positioned(
            top: -120,
            left: -120,
            child: Container(
              width: 250,
              height: 250,
              decoration: BoxDecoration(
                color: Colors.blue.withOpacity(0.12),
                shape: BoxShape.circle,
              ),
            ),
          ),

          // Bottom Right Glow
          Positioned(
            bottom: -120,
            right: -120,
            child: Container(
              width: 250,
              height: 250,
              decoration: BoxDecoration(
                color: Colors.purple.withOpacity(0.12),
                shape: BoxShape.circle,
              ),
            ),
          ),

          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                children: [
                  const SizedBox(height: 40),

                  /// Logo
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 52,
                        height: 52,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(14),
                          gradient: const LinearGradient(
                            colors: [
                              Colors.blue,
                              Colors.deepPurple,
                            ],
                          ),
                        ),
                        child: const Icon(
                          Icons.menu_book,
                          color: Colors.white,
                          size: 28,
                        ),
                      ),
                      const SizedBox(width: 12),
                      const Text(
                        "AuraLearn",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.deepPurple,
                        ),
                      ),
                    ],
                  ),

                  const Spacer(),

                  /// Main Illustration
                  Container(
                    width: 220,
                    height: 220,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                      gradient: LinearGradient(
                        colors: [
                          Colors.blue.withOpacity(.08),
                          Colors.purple.withOpacity(.08),
                        ],
                      ),
                    ),
                    child: const Center(
                      child: Icon(
                        Icons.school,
                        size: 120,
                        color: Colors.deepPurple,
                      ),
                    ),
                  ),

                  const SizedBox(height: 40),

                  const Text(
                    "Learn Anytime,\nAnywhere.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 34,
                      fontWeight: FontWeight.bold,
                      height: 1.2,
                    ),
                  ),

                  const SizedBox(height: 16),

                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24),
                    child: Text(
                      "Access premium interactive courses and track your daily stats with an elite learning ecosystem.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.grey,
                        height: 1.5,
                      ),
                    ),
                  ),

                  const Spacer(),

                  /// Button
                  SizedBox(
                    width: double.infinity,
                    height: 58,
                    child: ElevatedButton(
                      onPressed: () {
                        // Navigate
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.transparent,
                        shadowColor: Colors.transparent,
                        padding: EdgeInsets.zero,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18),
                        ),
                      ),
                      child: Ink(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(18),
                          gradient: const LinearGradient(
                            colors: [
                              Colors.blue,
                              Colors.deepPurple,
                            ],
                          ),
                        ),
                        child: InkWell(
                          onTap: (){
                            Navigator.push(context,
                              MaterialPageRoute(builder: (context) => OnboardingScreen()),
                            );
                          },
                          child: Container(
                            alignment: Alignment.center,
                            child: const Text(
                              "Get Started",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),

                  const Text(
                    "V1.0.2 • Secure Sandbox",
                    style: TextStyle(
                      fontSize: 11,
                      color: Colors.grey,
                      letterSpacing: 2,
                    ),
                  ),

                  const SizedBox(height: 30),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}