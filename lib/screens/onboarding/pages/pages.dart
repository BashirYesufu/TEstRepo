import 'package:flutter/cupertino.dart';
import 'package:apex/screens/onboarding/pages/onboarding_page.dart';
import '../../../constants/apex_images.dart';

class Pages {
  static List<OnBoardingPage> onboardingPages = [
    OnBoardingPage(
      alignment: AlignmentDirectional.topCenter,
      bottom: Image.asset(ApexImages.pageOneDevice),
      top: Image.asset(ApexImages.pageOneIllustration),
      title: 'Finance app the safest and most trusted',
      subtitle: 'Your finance work starts here. '
          'Our here to help you track and deal with speeding up your transactions.',
    ),
    OnBoardingPage(
      alignment: AlignmentDirectional.center,
      bottom: Image.asset(ApexImages.pageTwoDevice),
      top: Image.asset(ApexImages.pageTwoIllustration),
      title: 'The fastest transaction process only here',
      subtitle: 'Get easy to pay all your bills with just a few steps. Paying your bills become fast and efficient.',
    ),
  ];
}