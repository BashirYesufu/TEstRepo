import 'package:apex/screens/authentication/forgot_password_screen.dart';
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