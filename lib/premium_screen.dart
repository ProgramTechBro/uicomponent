import 'package:flutter/material.dart';

class PremiumScreen extends StatefulWidget {
  const PremiumScreen({Key? key}) : super(key: key);

  @override
  State<PremiumScreen> createState() => _PremiumScreenState();
}

class _PremiumScreenState extends State<PremiumScreen> {
  int selectedOption = 0; // 0: Fund 5 Scholar Reviews, 1: Annual

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    Color primaryGreen = const Color(0xFF4CAF50);
    Color lightGreen = const Color(0xFFE8F5E8);
    Color textColor = const Color(0xFF212121);
    Color subTextColor = const Color(0xFF757575);
    Color cardBorderColor = const Color(0xFFE0E0E0);
    Color dividerColor = const Color(0xFFE0E0E0);
    Color backgroundColor = const Color(0xFFF5F5F5);

    return Scaffold(
      backgroundColor: backgroundColor,
      body: Column(
        children: [
          // Image section with screenHeight * 1.3
          Container(
            height: screenHeight * 1.3,
            width: double.infinity,
            child: Stack(
              children: [
                // Background Image
                Positioned.fill(
                  child: Image.asset(
                    'assets/images/premium.png',
                    fit: BoxFit.cover,
                    width: double.infinity,
                  ),
                ),

                // Back arrow and "Support Us" text positioned on image
                Positioned(
                  left: screenWidth * 0.07,
                  top: MediaQuery.of(context).padding.top + screenHeight * 0.02,
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                          size: screenWidth * 0.06,
                        ),
                      ),
                      SizedBox(width: screenWidth * 0.03),
                      Text(
                        'Support Us',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: screenWidth * 0.055,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // White card with content
          Transform.translate(
            offset: Offset(0, -screenHeight * 0.08),
            child: Container(
              margin: EdgeInsets.only(
                left: screenWidth * 0.045,
                right: screenWidth * 0.045,
                bottom: screenHeight * 0.02,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(screenWidth * 0.04),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 10,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: Padding(
                padding: EdgeInsets.all(screenWidth * 0.05),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Title
                    Text(
                      'Support ',
                      style: TextStyle(
                        color: textColor,
                        fontSize: screenWidth * 0.065,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Our Mission',
                      style: TextStyle(
                        color: primaryGreen,
                        fontSize: screenWidth * 0.065,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    SizedBox(height: screenHeight * 0.015),

                    // Subtitle
                    Text(
                      'Help Us Keep Islamic Knowledge Accessible And Verified By Real Scholars.',
                      style: TextStyle(
                        color: subTextColor,
                        fontSize: screenWidth * 0.042,
                        height: 1.4,
                      ),
                    ),

                    SizedBox(height: screenHeight * 0.025),

                    // Features list with dividers
                    ...List.generate(
                      5,
                      (index) => Column(
                        children: [
                          Row(
                            children: [
                              Container(
                                width: screenWidth * 0.04,
                                height: screenWidth * 0.04,
                                decoration: BoxDecoration(
                                  color: Colors.blue,
                                  shape: BoxShape.circle,
                                ),
                                child: Icon(
                                  Icons.check,
                                  color: Colors.white,
                                  size: screenWidth * 0.025,
                                ),
                              ),
                              SizedBox(width: screenWidth * 0.025),
                              Text(
                                'Features',
                                style: TextStyle(
                                  color: textColor,
                                  fontSize: screenWidth * 0.042,
                                ),
                              ),
                            ],
                          ),
                          if (index < 4) ...[
                            SizedBox(height: screenHeight * 0.01),
                            Divider(
                              color: dividerColor,
                              thickness: 1,
                              height: screenHeight * 0.01,
                            ),
                            SizedBox(height: screenHeight * 0.01),
                          ],
                        ],
                      ),
                    ),

                    SizedBox(height: screenHeight * 0.02),

                    // Explanation text
                    Text(
                      'This directly covers the cost of a scholar\'s time to fully research, verify & write a detailed review for 5 questions ensuring its authenticity',
                      style: TextStyle(
                        color: subTextColor,
                        fontSize: screenWidth * 0.04,
                        height: 1.4,
                      ),
                    ),

                    SizedBox(height: screenHeight * 0.03),

                    // Donation options
                    GestureDetector(
                      onTap: () => setState(() => selectedOption = 0),
                      child: Container(
                        padding: EdgeInsets.all(screenWidth * 0.04),
                        decoration: BoxDecoration(
                          color:
                              selectedOption == 0
                                  ? lightGreen
                                  : Colors.grey[100],
                          borderRadius: BorderRadius.circular(
                            screenWidth * 0.025,
                          ),
                          border: Border.all(
                            color:
                                selectedOption == 0
                                    ? primaryGreen
                                    : cardBorderColor,
                            width: selectedOption == 0 ? 2 : 1,
                          ),
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Fund 5 Scholar Reviews',
                                    style: TextStyle(
                                      color: textColor,
                                      fontSize: screenWidth * 0.045,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(height: screenHeight * 0.005),
                                  Text(
                                    'Covers the cost of 5 scholar\'s reviews.',
                                    style: TextStyle(
                                      color: subTextColor,
                                      fontSize: screenWidth * 0.038,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Text(
                              'Rs. 1500',
                              style: TextStyle(
                                color: textColor,
                                fontSize: screenWidth * 0.045,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            if (selectedOption == 0) ...[
                              SizedBox(width: screenWidth * 0.02),
                              Icon(
                                Icons.check_circle,
                                color: primaryGreen,
                                size: screenWidth * 0.05,
                              ),
                            ],
                          ],
                        ),
                      ),
                    ),

                    SizedBox(height: screenHeight * 0.015),

                    GestureDetector(
                      onTap: () => setState(() => selectedOption = 1),
                      child: Container(
                        padding: EdgeInsets.all(screenWidth * 0.04),
                        decoration: BoxDecoration(
                          color:
                              selectedOption == 1
                                  ? lightGreen
                                  : Colors.grey[100],
                          borderRadius: BorderRadius.circular(
                            screenWidth * 0.025,
                          ),
                          border: Border.all(
                            color:
                                selectedOption == 1
                                    ? primaryGreen
                                    : cardBorderColor,
                            width: selectedOption == 1 ? 2 : 1,
                          ),
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Annual',
                                    style: TextStyle(
                                      color: textColor,
                                      fontSize: screenWidth * 0.045,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(height: screenHeight * 0.005),
                                  Text(
                                    'Covers the cost of 1 scholar\'s reviews.',
                                    style: TextStyle(
                                      color: subTextColor,
                                      fontSize: screenWidth * 0.038,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Text(
                              'Rs. 300',
                              style: TextStyle(
                                color: textColor,
                                fontSize: screenWidth * 0.045,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            if (selectedOption == 1) ...[
                              SizedBox(width: screenWidth * 0.02),
                              Icon(
                                Icons.check_circle,
                                color: primaryGreen,
                                size: screenWidth * 0.05,
                              ),
                            ],
                          ],
                        ),
                      ),
                    ),

                    const Spacer(),

                    // Donate button
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: primaryGreen,
                          padding: EdgeInsets.symmetric(
                            vertical: screenHeight * 0.022,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                              screenWidth * 0.03,
                            ),
                          ),
                        ),
                        onPressed: () {
                          // Handle donation
                        },
                        child: Text(
                          'Donate',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: screenWidth * 0.05,
                            letterSpacing: 0.5,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
