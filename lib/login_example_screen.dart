import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'forget_password_screen.dart';

class LoginExampleScreen extends StatefulWidget {
  const LoginExampleScreen({super.key});

  @override
  State<LoginExampleScreen> createState() => _LoginExampleScreenState();
}

class _LoginExampleScreenState extends State<LoginExampleScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: screenWidth * 0.06,
            vertical: screenHeight * 0.02,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: screenHeight * 0.05),
              
              // Title
              Text(
                'Welcome Back!',
                style: TextStyle(
                  fontSize: screenWidth * 0.08,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).textTheme.titleLarge?.color,
                ),
              ),
              
              SizedBox(height: screenHeight * 0.015),
              
              // Subtitle
              Text(
                'Sign in to your account',
                style: TextStyle(
                  fontSize: screenWidth * 0.042,
                  color: Theme.of(context).textTheme.bodyMedium?.color,
                ),
              ),
              
              SizedBox(height: screenHeight * 0.05),
              
              // Email Input
              Text(
                'Email Address',
                style: TextStyle(
                  fontSize: screenWidth * 0.045,
                  fontWeight: FontWeight.w600,
                  color: Theme.of(context).textTheme.titleMedium?.color,
                ),
              ),
              
              SizedBox(height: screenHeight * 0.01),
              
              TextFormField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                style: TextStyle(fontSize: screenWidth * 0.045),
                decoration: InputDecoration(
                  hintText: 'Enter your email address',
                  hintStyle: TextStyle(
                    color: Theme.of(context).hintColor,
                    fontSize: screenWidth * 0.04,
                  ),
                  prefixIcon: Icon(
                    Icons.email_outlined,
                    size: screenWidth * 0.06,
                    color: Theme.of(context).iconTheme.color,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(screenWidth * 0.03),
                    borderSide: BorderSide(
                      color: Theme.of(context).dividerColor,
                      width: 1.5,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(screenWidth * 0.03),
                    borderSide: BorderSide(
                      color: Theme.of(context).dividerColor,
                      width: 1.5,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(screenWidth * 0.03),
                    borderSide: BorderSide(
                      color: Theme.of(context).primaryColor,
                      width: 2.0,
                    ),
                  ),
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: screenWidth * 0.04,
                    vertical: screenHeight * 0.02,
                  ),
                ),
              ),
              
              SizedBox(height: screenHeight * 0.025),
              
              // Password Input
              Text(
                'Password',
                style: TextStyle(
                  fontSize: screenWidth * 0.045,
                  fontWeight: FontWeight.w600,
                  color: Theme.of(context).textTheme.titleMedium?.color,
                ),
              ),
              
              SizedBox(height: screenHeight * 0.01),
              
              TextFormField(
                controller: _passwordController,
                obscureText: true,
                style: TextStyle(fontSize: screenWidth * 0.045),
                decoration: InputDecoration(
                  hintText: 'Enter your password',
                  hintStyle: TextStyle(
                    color: Theme.of(context).hintColor,
                    fontSize: screenWidth * 0.04,
                  ),
                  prefixIcon: Icon(
                    Icons.lock_outline,
                    size: screenWidth * 0.06,
                    color: Theme.of(context).iconTheme.color,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(screenWidth * 0.03),
                    borderSide: BorderSide(
                      color: Theme.of(context).dividerColor,
                      width: 1.5,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(screenWidth * 0.03),
                    borderSide: BorderSide(
                      color: Theme.of(context).dividerColor,
                      width: 1.5,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(screenWidth * 0.03),
                    borderSide: BorderSide(
                      color: Theme.of(context).primaryColor,
                      width: 2.0,
                    ),
                  ),
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: screenWidth * 0.04,
                    vertical: screenHeight * 0.02,
                  ),
                ),
              ),
              
              SizedBox(height: screenHeight * 0.02),
              
              // Forgot Password Link
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {
                    // Navigate to Forget Password Screen
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const ForgetPasswordScreen(),
                      ),
                    );
                    // Alternative: Using GetX navigation
                    // Get.to(() => const ForgetPasswordScreen());
                    // Alternative: Using named route
                    // Get.toNamed('/forget-password');
                  },
                  child: Text(
                    'Forgot Password?',
                    style: TextStyle(
                      fontSize: screenWidth * 0.04,
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              
              SizedBox(height: screenHeight * 0.03),
              
              // Sign In Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    // Handle login logic here
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Login functionality would go here')),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(
                      vertical: screenHeight * 0.02,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(screenWidth * 0.03),
                    ),
                    backgroundColor: Theme.of(context).primaryColor,
                  ),
                  child: Text(
                    'Sign In',
                    style: TextStyle(
                      fontSize: screenWidth * 0.045,
                      fontWeight: FontWeight.w600,
                      color: Theme.of(context).colorScheme.onPrimary,
                    ),
                  ),
                ),
              ),
              
              const Spacer(),
              
              // Demo Navigation Button
              Center(
                child: TextButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const ForgetPasswordScreen(),
                      ),
                    );
                  },
                  style: TextButton.styleFrom(
                    backgroundColor: Theme.of(context).primaryColor.withOpacity(0.1),
                    padding: EdgeInsets.symmetric(
                      horizontal: screenWidth * 0.08,
                      vertical: screenHeight * 0.015,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(screenWidth * 0.03),
                    ),
                  ),
                  child: Text(
                    '🚀 Demo: Go to Forget Password Screen',
                    style: TextStyle(
                      fontSize: screenWidth * 0.04,
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              
              SizedBox(height: screenHeight * 0.02),
            ],
          ),
        ),
      ),
    );
  }
}