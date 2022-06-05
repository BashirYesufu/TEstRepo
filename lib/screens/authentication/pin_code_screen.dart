import 'package:apex/components/apex_button.dart';
import 'package:apex/components/apex_scaffold.dart';
import 'package:apex/components/screen_title.dart';
import 'package:apex/constants/color_constants.dart';
import 'package:apex/screens/authentication/pin_created_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

import '../../constants/text_styles.dart';

class PinCodeScreen extends StatelessWidget {
  const PinCodeScreen({Key? key}) : super(key: key);
  static const screenID = "PinCode";

  @override
  Widget build(BuildContext context) {
    return ApexScaffold(
      bottomNavBar: ApexButton(onPressed: (){
        //TODO Create User with Pin
        Navigator.pushNamed(context, PinCreatedScreen.screenID);
      }, text: 'Create PIN'),
      children: [
        ScreenTitle(
          title: 'Set your PIN code',
          subTitle:
              'We use state-of-the-art security measures to protect your information at all times',
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0),
          child: OtpTextField(
            numberOfFields: 5,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            showCursor: true,
            cursorColor: ApexColors.orange,
            obscureText: true,
            fieldWidth: 50,
            textStyle: ApexTextStyles.kBlack16,
            autoFocus: true,
            enabledBorderColor: ApexColors.orange,
            focusedBorderColor: ApexColors.orange,
            //runs when every textfield is filled
            onSubmit: (String verificationCode) {
              showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text("Verification Code"),
                      content: Text('Code entered is $verificationCode'),
                    );
                  });
            }, // end onSubmit
          ),
        ),
      ],
    );
  }
}
