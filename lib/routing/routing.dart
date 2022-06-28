import 'package:cabinet_assistant/register/otp_screen.dart';
import 'package:cabinet_assistant/register/phone_number_screen.dart';
import 'package:cabinet_assistant/register/signup_screen.dart';
import 'package:flutter/material.dart';

class Routing {
  static const String signUpScreen = 'sign_up_screen';
  static const String signInScreen = 'sign_in_screen';
  static const String otpScreen = 'otp_screen';
  static const String phoneNumberScreen = 'phone_number_screen';
  static const String homeScreen = 'home_screen';
  static const String initialScreen = 'initial_screen';

  static MaterialPageRoute? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case phoneNumberScreen:
        return MaterialPageRoute(
          builder: (context) => const PhoneNumberScreen(),
        );
      case otpScreen:
        return MaterialPageRoute(
          builder: (context) => OtpScreen(
            phoneNumber: settings.arguments as String,
          ),
        );
      case signUpScreen:
        return MaterialPageRoute(
          builder: (context) => const SignUpScreen(),
        );
      default:
        return MaterialPageRoute(
          builder: (context) => const Scaffold(
            body: Center(
              child: Text('Undefined route'),
            ),
          ),
        );
    }
  }
}
