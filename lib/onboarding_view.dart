import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'onboarding_controller.dart';

class OnboardingView extends StatelessWidget {
  OnboardingView({super.key});

  final List<Map<String, String>> onboardingData = [
    {
      'image': 'assets/images/onboarding_1.png',
      'title': 'Ask Anything with IslamMaster',
      'subtitle':
          'Get instant answers to your Islamic questions using AI trained with authentic sources.',
      'button': 'Next',
    },
    {
      'image': 'assets/images/onboarding_2.png',
      'title': 'Verified by Scholars',
      'subtitle':
          'AI responses can be verified by Islamic scholars so you get accurate, trusted guidance.',
      'button': 'Next',
    },
    {
      'image': 'assets/images/onboarding_3.png',
      'title': 'Join the Ummah',
      'subtitle': 'Browse, ask, and share questions with the community.',
      'button': 'Get Started',
    },
  ];

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final OnboardingController controller = Get.put(OnboardingController());
    final imageAreaHeight = screenHeight * 0.7;
    final fadeHeight = imageAreaHeight * 0.1; // 10% of image area
    final whiteHeight = imageAreaHeight * 0.4; // 40% of image area

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: screenHeight * 0.03),
            // Make image area flexible
            Expanded(
              child: Stack(
                children: [
                  // PageView for image only
                  PageView.builder(
                    controller: controller.pageController,
                    onPageChanged: controller.onPageChanged,
                    itemCount: onboardingData.length,
                    itemBuilder: (context, index) {
                      return Image.asset(
                        onboardingData[index]['image']!,
                        fit: BoxFit.contain,
                        width: double.infinity,
                        height: imageAreaHeight,
                      );
                    },
                  ),
                  // Smoggy fade (bottom 10% of image area)
                  Positioned(
                    left: 0,
                    right: 0,
                    bottom: whiteHeight,
                    height: fadeHeight,
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.transparent,
                            Colors.white.withOpacity(0.4), // updated opacity
                          ],
                        ),
                      ),
                    ),
                  ),
                  // Solid white (bottom 40% of image area)
                  Positioned(
                    left: 0,
                    right: 0,
                    bottom: 0,
                    height: whiteHeight,
                    child: Container(color: Colors.white),
                  ),
                  // Title, subtitle, indicator on top of the white area
                  Positioned(
                    left: 0,
                    right: 0,
                    bottom: 0,
                    height: whiteHeight,
                    child: Obx(() {
                      final page = controller.currentPage.value;
                      return Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: screenWidth * 0.08,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              onboardingData[page]['title']!,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: screenWidth * 0.06,
                                color: Colors.black,
                              ),
                            ),
                            SizedBox(height: screenHeight * 0.018),
                            Text(
                              onboardingData[page]['subtitle']!,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: screenWidth * 0.042,
                                color: const Color(0xFF7A7A7A),
                              ),
                            ),
                            SizedBox(height: screenHeight * 0.04),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: List.generate(
                                onboardingData.length,
                                (dotIndex) => AnimatedContainer(
                                  duration: Duration(milliseconds: 300),
                                  margin: EdgeInsets.symmetric(horizontal: 4),
                                  width:
                                      page == dotIndex
                                          ? screenWidth * 0.06
                                          : screenWidth * 0.025,
                                  height: screenWidth * 0.025,
                                  decoration: BoxDecoration(
                                    color:
                                        page == dotIndex
                                            ? const Color(0xFFA0C879)
                                            : const Color(0xFFE0E0E0),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    }),
                  ),
                ],
              ),
            ),
            // Buttons remain below the image area
            Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.08),
              child: Obx(() {
                final page = controller.currentPage.value;
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                      onPressed: controller.skip,
                      child: Text(
                        'Skip',
                        style: TextStyle(
                          color: const Color(0xFF7A7A7A),
                          fontSize: screenWidth * 0.045,
                        ),
                      ),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFA0C879),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                            screenWidth * 0.06,
                          ),
                        ),
                        padding: EdgeInsets.symmetric(
                          horizontal: screenWidth * 0.10,
                          vertical: screenHeight * 0.013,
                        ),
                      ),
                      onPressed: () {
                        if (page < onboardingData.length - 1) {
                          controller.nextPage();
                        } else {
                          // Navigate to AskQuestionScreen
                          Get.offAllNamed('/ask');
                        }
                      },
                      child: Text(
                        onboardingData[page]['button']!,
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: screenWidth * 0.05,
                        ),
                      ),
                    ),
                  ],
                );
              }),
            ),
            SizedBox(height: screenHeight * 0.03),
          ],
        ),
      ),
    );
  }
}
