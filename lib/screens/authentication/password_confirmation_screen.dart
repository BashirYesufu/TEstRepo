import 'package:apex/components/apex_button.dart';
import 'package:apex/components/apex_scaffold.dart';
import 'package:apex/components/screen_title.dart';
import 'package:apex/constants/apex_images.dart';
import 'package:flutter/material.dart';
import 'package:apex/screens/dashboard.dart';
import '../dashboard_arguments.dart';

class PasswordConfirmationScreen extends StatelessWidget {
  const PasswordConfirmationScreen({Key? key}) : super(key: key);
  static const screenID = "PasswordConfirmation";

  @override
  Widget build(BuildContext context) {
    return ApexScaffold(
      hasBackButton: false,
      bottomNavBar: ApexButton(
        onPressed: () {
          //TODO: Login with new password and go to dashboard
          //Navigator.pushNamed(context, DashBoard.screenID, arguments: DashBoardArguments(user: user));
        },
        text: 'Proceed to home',
      ),
      children: [
        Padding(
          padding: const EdgeInsets.all(30.0),
          child: Image.asset(ApexImages.passwordLock),
        ),
        ScreenTitle(
          title: 'New Password Created',
          subTitle: 'Hey Name, your password has been successfully updated.',
          crossAxisAlignment: CrossAxisAlignment.center,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
