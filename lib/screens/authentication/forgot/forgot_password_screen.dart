import 'package:apex/components/apex_button.dart';
import 'package:apex/components/apex_scaffold.dart';
import 'package:apex/components/apex_textfield.dart';
import 'package:apex/components/screen_title.dart';
import 'package:apex/screens/authentication/forgot/forgot_verification_screen.dart';
import 'package:flutter/material.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);
  static const screenID = "ForgotPassword";

  @override
  Widget build(BuildContext context) {
    return ApexScaffold(
      children: [
        ScreenTitle(
          title: 'Password Recovery',
          subTitle:
              'Enter your registered email below to receive password instructions',
        ),
        ApexTextField(
          hintText: 'Email',
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height / 6,
        ),
        ApexButton(
          onPressed: () {
            Navigator.pushNamed(context, ForgotVerificationScreen.screenID);
          },
          text: 'Send verification code',
        ),
      ],
    );
  }
}
