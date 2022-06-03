
import 'package:apex/screens/authentication/sign_in_screen.dart';
import 'package:apex/screens/onboarding/onboarding_screen.dart';
import 'package:flutter/cupertino.dart';

class RouteHandler {
  static String initialRoute = OnBoardingScreen.screenID;

  static Map<String, Widget Function(BuildContext)> routes = {
    OnBoardingScreen.screenID: (context) => OnBoardingScreen(),
    SignInScreen.screenID: (context) => SignInScreen(),
  };
}