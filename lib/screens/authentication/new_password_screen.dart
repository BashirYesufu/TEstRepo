import 'package:apex/components/apex_button.dart';
import 'package:apex/components/apex_scaffold.dart';
import 'package:apex/components/screen_title.dart';
import 'package:apex/screens/authentication/password_confirmation_screen.dart';
import 'package:flutter/material.dart';
import '../../components/apex_textfield.dart';

class NewPasswordScreen extends StatelessWidget {
  const NewPasswordScreen({Key? key}) : super(key: key);
  static const screenID = "NewPassword";

  @override
  Widget build(BuildContext context) {
    return ApexScaffold(
      bottomNavBar: ApexButton(
        onPressed: (){
          Navigator.pushNamed(context, PasswordConfirmationScreen.screenID);
        },
        text: 'Create new password',
      ),
      children: [
        ScreenTitle(
          title: 'Create New Password',
          subTitle:
              'Please, enter a new password below different from the previous password',
        ),
        ApexTextField(
          hintText: 'Password',
          hasObscuringSuffix: true,
        ),
        ApexTextField(
          hintText: 'Confirm password',
          hasObscuringSuffix: true,
        ),
      ],
    );
  }
}
