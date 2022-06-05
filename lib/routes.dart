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
import 'package:apex/screens/dashboard_arguments.dart';
import 'package:apex/screens/onboarding/onboarding_screen.dart';
import 'package:flutter/material.dart';

class RouteHandler {
  static String initialRoute = OnBoardingScreen.screenID;

  static Map<String, Widget Function(BuildContext)> routes = {
    OnBoardingScreen.screenID: (context) => OnBoardingScreen(),
    SignInScreen.screenID: (context) => SignInScreen(),
    SignUpScreen.screenID: (context) => SignUpScreen(),
    ForgotPasswordScreen.screenID: (context) => ForgotPasswordScreen(),
    EmailVerificationScreen.screenID: (context) => EmailVerificationScreen(email: 'email.com'),
    NewPasswordScreen.screenID: (context) => NewPasswordScreen(),
    PasswordConfirmationScreen.screenID: (context) => PasswordConfirmationScreen(),
    CountryResidence.screenID: (context) => CountryResidence(),
    PinCodeScreen.screenID: (context) => PinCodeScreen(),
    PinCreatedScreen.screenID: (context) => PinCreatedScreen(),
  };
  static Route<dynamic>? generateRoute(RouteSettings route) {
    switch (route.name) {
      case DashBoard.screenID:
        final args = route.arguments as DashBoardArguments;
        return MaterialPageRoute(builder: (context) {
          return DashBoard(user: args.user);
        });
      default:
        return null;
    }
  }
}