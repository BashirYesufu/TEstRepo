import 'package:apex/components/apex_button.dart';
import 'package:apex/components/apex_scaffold.dart';
import 'package:apex/components/apex_textfield.dart';
import 'package:apex/screens/authentication/forgot_password_screen.dart';
import 'package:apex/screens/authentication/sign_up_screen.dart';
import 'package:apex/screens/dashboard.dart';
import 'package:apex/utilities/services/auth_service.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../components/google_apple.dart';
import '../../components/screen_title.dart';
import '../../constants/text_styles.dart';
import '../../models/user.dart';
import '../../utilities/alert_handler.dart';
import '../../utilities/provider/providers/loading_provider.dart';
import '../../utilities/provider/providers/user_provider.dart';
import '../user_arguments.dart';

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
    final userProvider = Provider.of<UserProvider>(context);
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
                    Navigator.pushReplacementNamed(
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
          controller: _passwordTC,
          hasObscuringSuffix: true,
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
                  Navigator.pushNamed(context, ForgotPasswordScreen.screenID);
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
          onPressed: () async {
            final navigator = Navigator.of(context);
            if (hasText) {
              loader.load();
              try {
                User user = await AuthService().loginUser(
                    email: _emailTC.text, password: _passwordTC.text);
                userProvider.setUserToken(token: user.token);
                loader.stop();
                AlertHandler.showPopup(
                  context: context,
                  alert: 'Welcome back ${user.fullName}',
                  onPressed: () => navigator.pushNamed(DashBoard.screenID,
                      arguments: UserArguments(user: user)),
                );
              } catch (_) {
                loader.stop();
                AlertHandler.showErrorPopup(
                    context: context,
                    error: 'Incorrect email or password. Please try again');
              }
            } else {
              AlertHandler.showErrorPopup(
                  context: context, error: 'Please fill all fields');
            }
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
