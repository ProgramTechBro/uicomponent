# Forget Password Screen Setup Guide

This guide explains how to set up and use the forget password functionality with Firebase Authentication in your Flutter app.

## 📱 Features

- **Responsive Design**: Uses screen dimensions for font sizes and spacing
  - Font sizes: `screenWidth * 0.04` to `screenWidth * 0.08`
  - Vertical padding: `screenHeight * 0.01` to `screenHeight * 0.05`
  - Horizontal padding: `screenWidth * 0.03` to `screenWidth * 0.08`

- **Firebase Integration**: Uses `FirebaseAuth.instance.sendPasswordResetEmail()`
- **User-Friendly Dialog**: Shows success message after email is sent
- **Error Handling**: Handles various Firebase Auth exceptions
- **Form Validation**: Validates email format using GetX utilities

## 🚀 Setup Instructions

### 1. Firebase Dependencies
The following dependencies have been added to `pubspec.yaml`:
```yaml
dependencies:
  firebase_core: ^3.6.0
  firebase_auth: ^5.3.1
  get: ^4.6.5
```

### 2. Firebase Configuration

#### For Android:
1. Go to [Firebase Console](https://console.firebase.google.com/)
2. Create a new project or select existing one
3. Add Android app with your package name
4. Download `google-services.json` and place it in `android/app/`
5. Add to `android/app/build.gradle`:
```gradle
apply plugin: 'com.google.gms.google-services'
```
6. Add to `android/build.gradle`:
```gradle
dependencies {
    classpath 'com.google.gms:google-services:4.3.15'
}
```

#### For iOS:
1. Add iOS app in Firebase Console
2. Download `GoogleService-Info.plist` and add to `ios/Runner/`
3. Add to `ios/Runner/Info.plist`:
```xml
<key>CFBundleURLTypes</key>
<array>
    <dict>
        <key>CFBundleURLName</key>
        <string>REVERSED_CLIENT_ID</string>
        <key>CFBundleURLSchemes</key>
        <array>
            <string>YOUR_REVERSED_CLIENT_ID</string>
        </array>
    </dict>
</array>
```

### 3. Enable Authentication
1. In Firebase Console, go to Authentication > Sign-in method
2. Enable Email/Password authentication
3. Configure authorized domains if needed

## 📝 Usage

### Basic Navigation
```dart
// Navigate to Forget Password Screen
Navigator.of(context).push(
  MaterialPageRoute(
    builder: (context) => const ForgetPasswordScreen(),
  ),
);

// Or using GetX
Get.to(() => const ForgetPasswordScreen());

// Or using named routes
Get.toNamed('/forget-password');
```

### How It Works

1. **User Input**: User enters their email address
2. **Validation**: Email format is validated
3. **Firebase Call**: `FirebaseAuth.instance.sendPasswordResetEmail()` is called
4. **Success Dialog**: Shows confirmation dialog with:
   - **Main Text**: "Password Reset Email Sent"
   - **Subtext**: "We've sent a password reset link to your email address. Please check your inbox and follow the instructions to reset your password."
   - **Button**: "Got it" - closes dialog and returns to previous screen

### Error Handling
The screen handles these Firebase exceptions:
- `user-not-found`: No account found with this email
- `invalid-email`: Invalid email format
- `too-many-requests`: Rate limiting
- Generic errors with fallback messages

## 🎨 Responsive Design Details

### Font Sizes
- **Main Title**: `screenWidth * 0.08` (Large, bold)
- **Dialog Title**: `screenWidth * 0.055` (Medium-large, bold)
- **Input Fields**: `screenWidth * 0.045` (Medium)
- **Buttons**: `screenWidth * 0.045` (Medium)
- **Body Text**: `screenWidth * 0.04` to `0.042` (Regular)

### Spacing
- **Vertical Padding**: 
  - Large: `screenHeight * 0.05`
  - Medium: `screenHeight * 0.025`
  - Small: `screenHeight * 0.015`
- **Horizontal Padding**:
  - Container: `screenWidth * 0.06`
  - Elements: `screenWidth * 0.04`
  - Large: `screenWidth * 0.08`

### Element Sizing
- **Icons**: `screenWidth * 0.06` to `0.15`
- **Border Radius**: `screenWidth * 0.03` to `0.04`
- **Button Height**: `screenHeight * 0.02` padding

## 🔧 Customization

### Change Dialog Text
Modify the `_showSuccessDialog()` method in `ForgetPasswordScreen`:

```dart
Text(
  'Your Custom Main Text',  // Main dialog title
  style: TextStyle(
    fontSize: screenWidth * 0.055,
    fontWeight: FontWeight.bold,
  ),
),
Text(
  'Your custom subtitle message here.',  // Subtitle text
  style: TextStyle(
    fontSize: screenWidth * 0.04,
    height: 1.4,
  ),
),
```

### Change Button Text
```dart
Text(
  'Close',  // Change button text
  style: TextStyle(
    fontSize: screenWidth * 0.045,
    fontWeight: FontWeight.w600,
  ),
),
```

## 📁 File Structure
```
lib/
├── forget_password_screen.dart      # Main forget password screen
├── login_example_screen.dart        # Example login screen with navigation
├── main.dart                        # App entry point with Firebase init
└── ...
```

## 🧪 Testing

### Test the Screen
1. Run the app: `flutter run`
2. Navigate to `/login` route to see the demo login screen
3. Tap "Forgot Password?" or the demo button
4. Enter a valid email address
5. Tap "Send Reset Email"
6. Check the success dialog appears

### Firebase Testing
1. Ensure Firebase project is properly configured
2. Test with a real email address registered in your Firebase project
3. Check the email inbox for the password reset email
4. Verify the reset link works correctly

## 🚨 Important Notes

1. **Firebase Setup Required**: The app will crash if Firebase is not properly configured
2. **Internet Connection**: Password reset requires active internet connection
3. **Email Verification**: Users need access to their email to complete password reset
4. **Rate Limiting**: Firebase has built-in rate limiting for password reset emails
5. **Security**: Never expose Firebase configuration files in public repositories

## 🎯 Next Steps

1. Set up Firebase project and download configuration files
2. Run `flutter pub get` to install dependencies
3. Configure Firebase for your target platforms
4. Test the functionality with a real email address
5. Customize the UI to match your app's design system

---

**Note**: Make sure to replace placeholder values with your actual Firebase configuration details.