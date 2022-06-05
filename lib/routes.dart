import 'package:apex/screens/authentication/country_residence_screen.dart';
import 'package:apex/screens/authentication/email_verification_screen.dart';
import 'package:apex/screens/authentication/forgot_password_screen.dart';
import 'package:apex/screens/authentication/new_password_screen.dart';
import 'package:apex/screens/authentication/password_confirmation_screen.dart';
import 'package:apex/screens/authentication/pin_code_screen.dart';
import 'package:apex/screens/authentication/pin_created_screen.dart';
import 'package:apex/screens/authentication/sign_in_screen.dart';
import 'package:apex/screens/authentication/sign_up_screen.dart';
import 'package:apex/screens/dashboard.dart';
import 'package:apex/screens/user_arguments.dart';
import 'package:apex/screens/onboarding/onboarding_screen.dart';
import 'package:flutter/material.dart';

class RouteHandler {
  static String initialRoute = OnBoardingScreen.screenID;

  static Map<String, Widget Function(BuildContext)> routes = {
    OnBoardingScreen.screenID: (context) => OnBoardingScreen(),
    SignInScreen.screenID: (context) => SignInScreen(),
    SignUpScreen.screenID: (context) => SignUpScreen(),
    ForgotPasswordScreen.screenID: (context) => ForgotPasswordScreen(),
    NewPasswordScreen.screenID: (context) => NewPasswordScreen(),
    PasswordConfirmationScreen.screenID: (context) => PasswordConfirmationScreen(),
    EmailVerificationScreen.screenID: (context) => EmailVerificationScreen(),
    CountryResidenceScreen.screenID: (context) => CountryResidenceScreen(),
    PinCreatedScreen.screenID: (context) => PinCreatedScreen(),
    PinCodeScreen.screenID: (context) => PinCodeScreen(),
  };
  static Route<dynamic>? generateRoute(RouteSettings route) {
    switch (route.name) {
      case DashBoard.screenID:
        final args = route.arguments as UserArguments;
        return MaterialPageRoute(builder: (context) {
          return DashBoard(user: args.user);
        });

      default:
        return null;
    }
  }
}