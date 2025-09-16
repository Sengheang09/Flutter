import 'package:final_project/Views/login/welcome_screen.dart';
import 'package:final_project/const/themes/app_themes.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _controller = PageController();
  bool isLastPage = false;
  int currentIndex = 0;

  // Onboarding text data
  final List<Map<String, String>> onboardingData = [
    {
      "title": "Offers ad-free viewing of high quality",
      "subtitle":
          "Semper in cursus magna et eu varius nunc adipiscing. Elementum justo, laoreet id sem semper parturient. ",
    },
    {
      "title": "The biggest international and local films",
      "subtitle":
          "Access the largest collection of movies and series across genres.",
    },
    {
      "title": "Our service brings your favorites together",
      "subtitle":
          "Discover content you love, all in one app, tailored for you.",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppThemeData.primary_soft,
      body: SafeArea(
        child: Column(
          children: [
            // PageView with images only
            Expanded(
              child: PageView(
                controller: _controller,
                onPageChanged: (index) {
                  setState(() {
                    isLastPage = index == onboardingData.length - 1;
                    currentIndex = index;
                  });
                },
                children: [
                  buildImagePage("assets/images/onboarding1.png"),
                  buildImagePage("assets/images/Onboarding2.png"),
                  buildImagePage("assets/images/onboarding3.png"),
                ],
              ),
            ),

            // Bottom container with title, subtitle, indicator, and button
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 30,
                  vertical: 20,
                ),
                width: 380,
                height: 320,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: AppThemeData.primary_dark,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Title
                    Text(
                      onboardingData[currentIndex]["title"]!,
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 16),

                    // Subtitle
                    Text(
                      onboardingData[currentIndex]["subtitle"]!,
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.white70,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 24),

                    // Page indicator + Next/Done button
                    Spacer(),
                    Padding(
                      padding: const EdgeInsets.only(top: 60),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SmoothPageIndicator(
                            controller: _controller,
                            count: onboardingData.length,
                            effect: const ExpandingDotsEffect(
                              activeDotColor: Colors.tealAccent,
                              dotHeight: 8,
                              dotWidth: 8,
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              if (isLastPage) {
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const WelcomeScreen(),
                                  ),
                                );
                              } else {
                                _controller.nextPage(
                                  duration: const Duration(milliseconds: 500),
                                  curve: Curves.easeInOut,
                                );
                              }
                            },
                            child: Text(
                              isLastPage ? "Done" : "Next",
                              style: const TextStyle(color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Widget to show image page
  Widget buildImagePage(String imagePath) {
    return Stack(
      children: [
        // Background shapes
        Positioned(
          top: -40,
          left: -40,
          child: Container(
            width: 120,
            height: 120,
            decoration: BoxDecoration(
              color: Colors.teal.withOpacity(0.3),
              shape: BoxShape.circle,
            ),
          ),
        ),
        Positioned(
          bottom: 100,
          right: -30,
          child: Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              color: Colors.orange.withOpacity(0.3),
              shape: BoxShape.circle,
            ),
          ),
        ),

        // Main image
        Center(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Image.asset(imagePath, height: 300),
          ),
        ),
      ],
    );
  }
}
