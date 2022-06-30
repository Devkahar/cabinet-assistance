import 'package:cabinet_assistant/authentication/screen/forgot_password_screen.dart';
import 'package:cabinet_assistant/authentication/screen/new_password_screen.dart';
import 'package:cabinet_assistant/authentication/screen/phone_number_screen.dart';
import 'package:cabinet_assistant/authentication/screen/otp_screen.dart';
import 'package:cabinet_assistant/authentication/screen/signup_screen.dart';
import 'package:cabinet_assistant/utils/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:cabinet_assistant/authentication/screen/signin_screen.dart';

class Routing {
  static const String signUpScreen = 'sign_up_screen';
  static const String signInScreen = 'sign_in_screen';
  static const String otpScreen = 'otp_screen';
  static const String phoneNumberScreen = 'phone_number_screen';
  static const String homeScreen = 'home_screen';
  static const String initialScreen = 'initial_screen';
  static const String forgotPasswordScreen = 'forgot_password_screen';
  static const String newPasswordScreen = 'confirm_password_screen';

  static MaterialPageRoute? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case phoneNumberScreen:
        return MaterialPageRoute(
          builder: (context) => const PhoneNumberScreen(),
        );
      case otpScreen:
        final screenArgs = settings.arguments as Map<String,dynamic>;
        return MaterialPageRoute(
          builder: (context) => OtpScreen(
            phoneNumber:screenArgs[AppConstants.phoneNumber],
            screenRedirection: screenArgs[AppConstants.redirectScreen],
          ),
        );
      case signUpScreen:
        return MaterialPageRoute(
          builder: (context) => const SignUpScreen(),
        );
      case signInScreen:
        return MaterialPageRoute(
          builder: (context) => const SignInScreen(),
        );
      case forgotPasswordScreen:
        return MaterialPageRoute(
          builder: (context) => const ForgotPasswordScreen(),
        );
      case newPasswordScreen:
        return MaterialPageRoute(
          builder: (context) => const NewPasswordScreen(),
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
