import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AskQuestionScreen extends StatefulWidget {
  const AskQuestionScreen({Key? key}) : super(key: key);

  @override
  State<AskQuestionScreen> createState() => _AskQuestionScreenState();
}

class _AskQuestionScreenState extends State<AskQuestionScreen> {
  bool isPrivate = true;
  int reviewType = 1; // 0: Free, 1: Quick

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    Color borderColor = const Color(0xFFE0E0E0);
    Color toggleActive = const Color(0xFF4CAF50);
    Color toggleInactive = const Color(0xFFBDBDBD);
    Color radioActive = const Color(0xFF4CAF50);
    Color radioInactive = const Color(0xFFBDBDBD);
    Color askButton = const Color(0xFF2196F3);
    Color errorColor = const Color(0xFFD32F2F);
    Color textColor = const Color(0xFF212121);
    Color subTextColor = const Color(0xFF757575);
    Color dividerColor = const Color(0xFFE0E0E0);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'Ask a Question',
          style: TextStyle(
            color: textColor,
            fontWeight: FontWeight.bold,
            fontSize: screenWidth * 0.055,
          ),
        ),
        centerTitle: false,
        iconTheme: IconThemeData(color: textColor),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: screenWidth * 0.045,
            vertical: screenHeight * 0.02,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: screenWidth * 0.04,
                  vertical: screenHeight * 0.018,
                ),
                decoration: BoxDecoration(
                  color: const Color(0xFFF5F5F5),
                  borderRadius: BorderRadius.circular(screenWidth * 0.025),
                  border: Border.all(color: borderColor),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: TextField(
                        maxLines: 2,
                        minLines: 1,
                        style: TextStyle(
                          fontSize: screenWidth * 0.045,
                          color: textColor,
                        ),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText:
                              'e.g. When was Hazrat Muhammad (PBUH) born?',
                          hintStyle: TextStyle(
                            color: subTextColor,
                            fontSize: screenWidth * 0.045,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: screenWidth * 0.01),
                    Icon(
                      Icons.attach_file,
                      color: subTextColor,
                      size: screenWidth * 0.06,
                    ),
                    SizedBox(width: screenWidth * 0.02),
                    Icon(
                      Icons.camera_alt_outlined,
                      color: subTextColor,
                      size: screenWidth * 0.06,
                    ),
                    SizedBox(width: screenWidth * 0.02),
                    Icon(
                      Icons.mic_none,
                      color: subTextColor,
                      size: screenWidth * 0.06,
                    ),
                  ],
                ),
              ),
              SizedBox(height: screenHeight * 0.025),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text(
                        'Make this question private',
                        style: TextStyle(
                          color: textColor,
                          fontSize: screenWidth * 0.042,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(width: screenWidth * 0.015),
                      Tooltip(
                        message:
                            'Only you and the reviewing scholar will see this question. It won\'t appear on the Community page.',
                        child: Icon(
                          Icons.info_outline,
                          color: subTextColor,
                          size: screenWidth * 0.045,
                        ),
                      ),
                    ],
                  ),
                  Switch(
                    value: isPrivate,
                    onChanged: (val) {
                      setState(() => isPrivate = val);
                    },
                    activeColor: toggleActive,
                    inactiveThumbColor: toggleInactive,
                  ),
                ],
              ),
              SizedBox(height: screenHeight * 0.01),
              Divider(color: dividerColor, thickness: 1),
              SizedBox(height: screenHeight * 0.01),
              Text(
                'Get Quick Review by Scholar?',
                style: TextStyle(
                  color: textColor,
                  fontWeight: FontWeight.w600,
                  fontSize: screenWidth * 0.045,
                ),
              ),
              SizedBox(height: screenHeight * 0.01),
              Row(
                children: [
                  Radio<int>(
                    value: 0,
                    groupValue: reviewType,
                    onChanged: (val) {
                      setState(() => reviewType = val!);
                    },
                    activeColor: radioActive,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Free Review (Standard)',
                        style: TextStyle(
                          color: textColor,
                          fontSize: screenWidth * 0.042,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        'Usually get reviewed in 24-48 hours.',
                        style: TextStyle(
                          color: subTextColor,
                          fontSize: screenWidth * 0.037,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: screenHeight * 0.005),
              Row(
                children: [
                  Radio<int>(
                    value: 1,
                    groupValue: reviewType,
                    onChanged: (val) {
                      setState(() => reviewType = val!);
                    },
                    activeColor: radioActive,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            'Quick Review (Priority)',
                            style: TextStyle(
                              color: textColor,
                              fontSize: screenWidth * 0.042,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(width: screenWidth * 0.01),
                          Icon(
                            Icons.flash_on,
                            color: radioActive,
                            size: screenWidth * 0.045,
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            'Get reviewed faster within ',
                            style: TextStyle(
                              color: subTextColor,
                              fontSize: screenWidth * 0.037,
                            ),
                          ),
                          Text(
                            '2 hours.',
                            style: TextStyle(
                              color: radioActive,
                              fontSize: screenWidth * 0.037,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: screenHeight * 0.025),
              Row(
                children: [
                  Icon(
                    Icons.info_outline,
                    color: errorColor,
                    size: screenWidth * 0.045,
                  ),
                  SizedBox(width: screenWidth * 0.01),
                  Expanded(
                    child: Text(
                      'You’ll get an instant AI answer, which will also be reviewed and verified by a Mufti for accuracy.',
                      style: TextStyle(
                        color: errorColor,
                        fontSize: screenWidth * 0.037,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: screenHeight * 0.03),
              Center(
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: askButton,
                      padding: EdgeInsets.symmetric(
                        vertical: screenHeight * 0.022,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(screenWidth * 0.03),
                      ),
                    ),
                    onPressed: () {
                      Get.toNamed('/premium');
                    },
                    child: Text(
                      'Ask AI',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: screenWidth * 0.05,
                        letterSpacing: 0.5,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
