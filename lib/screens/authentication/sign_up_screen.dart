import 'package:apex/components/apex_scaffold.dart';
import 'package:apex/screens/authentication/sign_in_screen.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../components/apex_button.dart';
import '../../components/apex_textfield.dart';
import '../../components/google_apple.dart';
import '../../constants/text_styles.dart';
import '../../utilities/provider/providers/loading_provider.dart';
import 'email_verification_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);
  static const screenID = "SignUp";

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _emailTC = TextEditingController();
  final TextEditingController _passwordTC = TextEditingController();
  final TextEditingController _nameTC = TextEditingController();

  bool hasText = false;

  @override
  Widget build(BuildContext context) {
    final loader = Provider.of<LoadingStateProvider>(context);
    return ApexScaffold(
      hasBackButton: false,
        bottomNavBar: RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            text: 'Already have an account? ',
            style: ApexTextStyles.kDarkGrey16,
            children: [
              TextSpan(
                  text: 'Sign In',
                  style: ApexTextStyles.kOrange16,
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      Navigator.pushNamed(
                          context, SignInScreen.screenID);
                    }),
            ],
          ),
        ),
      children: [
        Row(
          children: [
            RichText(
              textAlign: TextAlign.start,
              text: TextSpan(
                text: 'Create a ',
                style: ApexTextStyles.kBlackBold28,
                children: [
                  TextSpan(
                      text: 'SmartPay \n',
                      style: ApexTextStyles.kOrangeBold28,
                      ),
                  TextSpan(
                    text: 'account',
                    style: ApexTextStyles.kBlackBold28,
                  ),
                ],
              ),
            ),
            Spacer(),
          ],
        ),
        ApexTextField(
          hintText: 'Full name',
          controller: _nameTC,
          onChanged: (value) {
            checkButton();
          },
        ),
        ApexTextField(
          hintText: 'Email',
          controller: _emailTC,
          onChanged: (value) {
            checkButton();
          },
        ),
        ApexTextField(
          hintText: 'Password',
          obscureText: true,
          controller: _passwordTC,
          onChanged: (value) {
            checkButton();
          },
        ),
        SizedBox(height: 30,),
        ApexButton(
          onPressed: () async {
           //TODO: Navigate to email verification
            Navigator.pushNamed(context, EmailVerificationScreen.screenID);
          },
          text: 'Sign Up',
          enabled: hasText,
        ),
        GoogleApple()
      ]
    );
  }

  // Validate if textfields contain text
  checkButton(){
    setState(() {
    if (_emailTC.text.isNotEmpty && _passwordTC.text.isNotEmpty && _nameTC.text.isNotEmpty){
      hasText = true;
    } else {
      hasText = false;
    }
    });
  }
}
