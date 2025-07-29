import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dashboard_screen.dart';
import 'login_example_screen.dart';
import 'forget_password_screen.dart';

class NavigationDemoScreen extends StatelessWidget {
  const NavigationDemoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    final List<Map<String, dynamic>> screens = [
      {
        'title': 'Dashboard Screen',
        'subtitle': 'Admin dashboard with stats and pending questions',
        'icon': Icons.dashboard,
        'route': () => const DashboardScreen(),
        'color': const Color(0xFF6C63FF),
      },
      {
        'title': 'Login Example',
        'subtitle': 'Login screen with forget password navigation',
        'icon': Icons.login,
        'route': () => const LoginExampleScreen(),
        'color': const Color(0xFF2ED573),
      },
      {
        'title': 'Forget Password',
        'subtitle': 'Firebase password reset functionality',
        'icon': Icons.lock_reset,
        'route': () => const ForgetPasswordScreen(),
        'color': const Color(0xFFFF9F43),
      },
    ];

    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.5,
        title: Text(
          'Screen Navigation Demo',
          style: TextStyle(
            fontSize: screenWidth * 0.055,
            fontWeight: FontWeight.w600,
            color: const Color(0xFF1A1A1A),
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(screenWidth * 0.04),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(screenWidth * 0.04),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFF6C63FF), Color(0xFF5A52D5)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(screenWidth * 0.03),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Welcome to the Demo!',
                    style: TextStyle(
                      fontSize: screenWidth * 0.055,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.01),
                  Text(
                    'Explore all the screens that have been created. Tap on any card below to navigate.',
                    style: TextStyle(
                      fontSize: screenWidth * 0.038,
                      color: Colors.white.withOpacity(0.9),
                    ),
                  ),
                ],
              ),
            ),
            
            SizedBox(height: screenHeight * 0.03),
            
            Text(
              'Available Screens',
              style: TextStyle(
                fontSize: screenWidth * 0.05,
                fontWeight: FontWeight.w600,
                color: const Color(0xFF1A1A1A),
              ),
            ),
            
            SizedBox(height: screenHeight * 0.02),
            
            Expanded(
              child: ListView.builder(
                itemCount: screens.length,
                itemBuilder: (context, index) {
                  final screen = screens[index];
                  return Container(
                    margin: EdgeInsets.only(bottom: screenHeight * 0.02),
                    child: InkWell(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => screen['route'](),
                          ),
                        );
                      },
                      borderRadius: BorderRadius.circular(screenWidth * 0.03),
                      child: Container(
                        padding: EdgeInsets.all(screenWidth * 0.04),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(screenWidth * 0.03),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.05),
                              blurRadius: 10,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                        child: Row(
                          children: [
                            Container(
                              padding: EdgeInsets.all(screenWidth * 0.03),
                              decoration: BoxDecoration(
                                color: screen['color'].withOpacity(0.1),
                                borderRadius: BorderRadius.circular(screenWidth * 0.025),
                              ),
                              child: Icon(
                                screen['icon'],
                                color: screen['color'],
                                size: screenWidth * 0.08,
                              ),
                            ),
                            
                            SizedBox(width: screenWidth * 0.04),
                            
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    screen['title'],
                                    style: TextStyle(
                                      fontSize: screenWidth * 0.045,
                                      fontWeight: FontWeight.w600,
                                      color: const Color(0xFF1A1A1A),
                                    ),
                                  ),
                                  SizedBox(height: screenHeight * 0.005),
                                  Text(
                                    screen['subtitle'],
                                    style: TextStyle(
                                      fontSize: screenWidth * 0.035,
                                      color: const Color(0xFF666666),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            
                            Icon(
                              Icons.arrow_forward_ios,
                              size: screenWidth * 0.04,
                              color: const Color(0xFF999999),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(screenWidth * 0.04),
              decoration: BoxDecoration(
                color: const Color(0xFFF0F0F0),
                borderRadius: BorderRadius.circular(screenWidth * 0.03),
                border: Border.all(
                  color: const Color(0xFFE0E0E0),
                  width: 1,
                ),
              ),
              child: Column(
                children: [
                  Icon(
                    Icons.info_outline,
                    size: screenWidth * 0.06,
                    color: const Color(0xFF6C63FF),
                  ),
                  SizedBox(height: screenHeight * 0.01),
                  Text(
                    'Demo Note',
                    style: TextStyle(
                      fontSize: screenWidth * 0.04,
                      fontWeight: FontWeight.w600,
                      color: const Color(0xFF1A1A1A),
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.005),
                  Text(
                    'All screens use responsive design with screen dimensions. The dashboard uses dummy data that can be replaced with real data later.',
                    style: TextStyle(
                      fontSize: screenWidth * 0.035,
                      color: const Color(0xFF666666),
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}