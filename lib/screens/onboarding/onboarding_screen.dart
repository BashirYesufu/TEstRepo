import 'package:apex/components/apex_button.dart';
import 'package:apex/constants/color_constants.dart';
import 'package:apex/constants/text_styles.dart';
import 'package:apex/screens/authentication/sign_in_screen.dart';
import 'package:apex/screens/onboarding/pages/pages.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../components/apex_scaffold.dart';

class OnBoardingScreen extends StatelessWidget {
  OnBoardingScreen({Key? key}) : super(key: key);
  static const screenID = "OnBoarding";
  final _controller = PageController();

  @override
  Widget build(BuildContext context) {
    return ApexScaffold(
      hasBackButton: false,
      bottomNavBar: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        child: ApexButton(onPressed: (){
          Navigator.pushReplacementNamed(context, SignInScreen.screenID);
        }, text: 'Get Started',),
      ),
      trailing: [
        Transform.translate(
          offset: Offset(-20.0, 0.0),
          child: InkWell(
            onTap: (){
              Navigator.pushReplacementNamed(context, SignInScreen.screenID);
            },
            child: Text('Skip', style: ApexTextStyles.kOrange16,),),
        )
      ],
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(height: 50,),
              SizedBox(
                height: 500,
                child: PageView(
                  controller: _controller,
                  children: Pages.onboardingPages,
                ),
              ),
              SmoothPageIndicator(
                controller: _controller,
                count: Pages.onboardingPages.length,
                effect: ExpandingDotsEffect(
                  activeDotColor: ApexColors.black,
                  dotColor: ApexColors.grey,
                  dotHeight: 8,
                  dotWidth: 8,
                  spacing: 10,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
