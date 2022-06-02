
import 'package:apex/screens/onboarding/onboarding.dart';
import 'package:flutter/cupertino.dart';

class RouteHandler {
  static String initialRoute = OnBoarding.screenID;

  static Map<String, Widget Function(BuildContext)> routes = {
    OnBoarding.screenID: (context) => OnBoarding(),

  };
}