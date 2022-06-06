import 'package:apex/components/apex_scaffold.dart';
import 'package:apex/screens/authentication/sign_in_screen.dart';
import 'package:apex/utilities/alert_handler.dart';
import 'package:apex/utilities/services/auth_service.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../components/apex_button.dart';
import '../../components/apex_textfield.dart';
import '../../components/google_apple.dart';
import '../../constants/text_styles.dart';
import '../../utilities/provider/providers/loading_provider.dart';
import '../../utilities/provider/providers/user_provider.dart';
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
  bool showPassword = false;

  @override
  Widget build(BuildContext context) {
    final loader = Provider.of<LoadingStateProvider>(context);
    final userProvider = Provider.of<UserProvider>(context);
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
                      Navigator.pushReplacementNamed(
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
            controller: _passwordTC,
            hasObscuringSuffix: true,
            onChanged: (value) {
              checkButton();
            },
          ),
          SizedBox(
            height: 30,
          ),
          ApexButton(
            onPressed: () async {
              final navigator = Navigator.of(context);
              if(hasText){
                try {
                  loader.load();
                  String token =
                  await AuthService().getEmailToken(email: _emailTC.text);
                  loader.stop();
                  userProvider.setUserEmail(email: _emailTC.text);
                  userProvider.setUserFullName(fullName: _nameTC.text);
                  userProvider.setUserPassword(password: _passwordTC.text);
                  AlertHandler.showPopup(
                    context: context,
                    alert: 'Your OTP is $token',
                    onPressed: () => navigator.pushNamed(EmailVerificationScreen.screenID),
                  );
                } catch (e) {
                  loader.stop();
                  print(e);
                  AlertHandler.showErrorPopup(context: context, error: 'An error occurred while creating your account. Please try again');
                }
              } else {
                AlertHandler.showErrorPopup(context: context, error: 'Please fill all fields. Passwords must contain at least one uppercase, lowercase, number and special character');
              }
            },
            text: 'Sign Up',
            enabled: hasText,
          ),
          GoogleApple()
        ],
    );
  }

  // Validate if textfields contain text
  checkButton() {
    bool hasNum = _passwordTC.text.contains(RegExp(r'[0-9]'));
    print(hasNum);
    setState(() {
      if (_emailTC.text.isNotEmpty &&
          _passwordTC.text.isNotEmpty &&
          hasNum &&
          _nameTC.text.isNotEmpty) {
        hasText = true;
      } else {
        hasText = false;
      }
    });
  }
}
