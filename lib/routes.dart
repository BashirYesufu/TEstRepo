import 'package:apex/screens/authentication/signup/country_residence_screen.dart';
import 'package:apex/screens/authentication/signup/email_verification_screen.dart';
import 'package:apex/screens/authentication/forgot/forgot_password_screen.dart';
import 'package:apex/screens/authentication/forgot/forgot_verification_screen.dart';
import 'package:apex/screens/authentication/forgot/new_password_screen.dart';
import 'package:apex/screens/authentication/forgot/password_confirmation_screen.dart';
import 'package:apex/screens/authentication/signup/pin_code_screen.dart';
import 'package:apex/screens/authentication/signup/pin_created_screen.dart';
import 'package:apex/screens/authentication/signin/sign_in_screen.dart';
import 'package:apex/screens/authentication/signup/sign_up_screen.dart';
import 'package:apex/screens/dashboard.dart';
import 'package:apex/screens/user_arguments.dart';
import 'package:apex/screens/onboarding/onboarding_screen.dart';
import 'package:flutter/material.dart';

class RouteHandler {
  static String initialRoute = OnBoardingScreen.screenID;

  static String onBoardedRoute = SignInScreen.screenID;

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
    ForgotVerificationScreen.screenID: (context) => ForgotVerificationScreen(),
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