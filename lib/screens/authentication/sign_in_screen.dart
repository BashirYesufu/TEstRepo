import 'package:apex/components/apex_button.dart';
import 'package:apex/components/apex_scaffold.dart';
import 'package:apex/components/apex_textfield.dart';
import 'package:apex/screens/authentication/forgot_password_screen.dart';
import 'package:apex/screens/authentication/sign_up_screen.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../components/google_apple.dart';
import '../../components/screen_title.dart';
import '../../constants/text_styles.dart';
import '../../utilities/provider/providers/loading_provider.dart';

class SignInScreen extends StatefulWidget {
  SignInScreen({Key? key}) : super(key: key);
  static const screenID = "SignIn";

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final TextEditingController _emailTC = TextEditingController();
  final TextEditingController _passwordTC = TextEditingController();

  bool hasText = false;

  @override
  Widget build(BuildContext context) {
    final loader = Provider.of<LoadingStateProvider>(context);
    return ApexScaffold(
        hasBackButton: false,
        bottomNavBar: RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            text: 'Don\'t have an account? ',
            style: ApexTextStyles.kDarkGrey16,
            children: [
              TextSpan(
                  text: 'Sign Up',
                  style: ApexTextStyles.kOrange16,
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      Navigator.pushNamed(
                          context, SignUpScreen.screenID);
                    }),
            ],
          ),
        ),
        children: [
      ScreenTitle(
        title: 'Hi There! 👋 ',
        subTitle: 'Welcome back, Sign in to your account',
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
      Padding(
        padding: EdgeInsets.symmetric(vertical: 15.0),
        child: Row(
          children: [
            InkWell(
              onTap: () {
                  Navigator.pushNamed(
                      context, ForgotPasswordScreen.screenID);
              },
              child: Text(
                'Forgot Password?',
                style: ApexTextStyles.kOrange16,
              ),
            ),
            Spacer()
          ],
        ),
      ),
      ApexButton(
        onPressed: () {
          //TODO: Login User
          loader.load();
        },
        text: 'Sign In',
        enabled: hasText,
      ),
      GoogleApple()
    ],
    );
  }

  checkButton() {
    setState(() {
      if (_emailTC.text.isNotEmpty && _passwordTC.text.isNotEmpty) {
        hasText = true;
      } else {
        hasText = false;
      }
    });
  }
}
