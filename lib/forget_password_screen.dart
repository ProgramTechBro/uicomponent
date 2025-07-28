import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({super.key});

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  final TextEditingController _emailController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _isLoading = false;

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  Future<void> _sendPasswordResetEmail() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() {
      _isLoading = true;
    });

    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(
        email: _emailController.text.trim(),
      );
      _showSuccessDialog();
    } on FirebaseAuthException catch (e) {
      String errorMessage;
      switch (e.code) {
        case 'user-not-found':
          errorMessage = 'No account found with this email address.';
          break;
        case 'invalid-email':
          errorMessage = 'Please enter a valid email address.';
          break;
        case 'too-many-requests':
          errorMessage = 'Too many requests. Please try again later.';
          break;
        default:
          errorMessage = 'An error occurred. Please try again.';
      }
      _showErrorSnackBar(errorMessage);
    } catch (e) {
      _showErrorSnackBar('An unexpected error occurred. Please try again.');
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  void _showSuccessDialog() {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(screenWidth * 0.04),
          ),
          child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: screenWidth * 0.06,
              vertical: screenHeight * 0.03,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.mark_email_read_outlined,
                  size: screenWidth * 0.15,
                  color: Theme.of(context).primaryColor,
                ),
                SizedBox(height: screenHeight * 0.02),
                Text(
                  'Password Reset Email Sent',
                  style: TextStyle(
                    fontSize: screenWidth * 0.055,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).textTheme.titleLarge?.color,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: screenHeight * 0.015),
                Text(
                  'We\'ve sent a password reset link to your email address. Please check your inbox and follow the instructions to reset your password.',
                  style: TextStyle(
                    fontSize: screenWidth * 0.04,
                    color: Theme.of(context).textTheme.bodyMedium?.color,
                    height: 1.4,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: screenHeight * 0.025),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                      Navigator.of(context).pop(); // Go back to previous screen
                    },
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(
                        vertical: screenHeight * 0.018,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(screenWidth * 0.03),
                      ),
                    ),
                    child: Text(
                      'Got it',
                      style: TextStyle(
                        fontSize: screenWidth * 0.045,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _showErrorSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.red,
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: Icon(
            Icons.arrow_back_ios,
            color: Theme.of(context).iconTheme.color,
            size: screenWidth * 0.06,
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: screenWidth * 0.06,
            vertical: screenHeight * 0.02,
          ),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: screenHeight * 0.03),
                
                // Title
                Text(
                  'Forgot Password?',
                  style: TextStyle(
                    fontSize: screenWidth * 0.08,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).textTheme.titleLarge?.color,
                  ),
                ),
                
                SizedBox(height: screenHeight * 0.015),
                
                // Subtitle
                Text(
                  'Don\'t worry! Enter your email address and we\'ll send you a link to reset your password.',
                  style: TextStyle(
                    fontSize: screenWidth * 0.042,
                    color: Theme.of(context).textTheme.bodyMedium?.color,
                    height: 1.5,
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
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email address';
                    }
                    if (!GetUtils.isEmail(value)) {
                      return 'Please enter a valid email address';
                    }
                    return null;
                  },
                ),
                
                SizedBox(height: screenHeight * 0.05),
                
                // Send Button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: _isLoading ? null : _sendPasswordResetEmail,
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(
                        vertical: screenHeight * 0.02,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(screenWidth * 0.03),
                      ),
                      backgroundColor: Theme.of(context).primaryColor,
                      disabledBackgroundColor: Theme.of(context).disabledColor,
                    ),
                    child: _isLoading
                        ? SizedBox(
                            height: screenWidth * 0.06,
                            width: screenWidth * 0.06,
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              valueColor: AlwaysStoppedAnimation<Color>(
                                Theme.of(context).colorScheme.onPrimary,
                              ),
                            ),
                          )
                        : Text(
                            'Send Reset Email',
                            style: TextStyle(
                              fontSize: screenWidth * 0.045,
                              fontWeight: FontWeight.w600,
                              color: Theme.of(context).colorScheme.onPrimary,
                            ),
                          ),
                  ),
                ),
                
                SizedBox(height: screenHeight * 0.03),
                
                // Back to Login
                Center(
                  child: TextButton(
                    onPressed: () => Navigator.of(context).pop(),
                    child: RichText(
                      text: TextSpan(
                        text: 'Remember your password? ',
                        style: TextStyle(
                          fontSize: screenWidth * 0.04,
                          color: Theme.of(context).textTheme.bodyMedium?.color,
                        ),
                        children: [
                          TextSpan(
                            text: 'Sign In',
                            style: TextStyle(
                              fontSize: screenWidth * 0.04,
                              color: Theme.of(context).primaryColor,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                
                const Spacer(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}