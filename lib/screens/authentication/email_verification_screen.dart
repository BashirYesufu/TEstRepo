import 'package:apex/components/apex_button.dart';
import 'package:apex/components/apex_scaffold.dart';
import 'package:apex/components/screen_title.dart';
import 'package:apex/constants/color_constants.dart';
import 'package:apex/constants/text_styles.dart';
import 'package:apex/screens/authentication/new_password_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

class EmailVerificationScreen extends StatelessWidget {
  EmailVerificationScreen({required this.email, Key? key}) : super(key: key);
  static const screenID = "EmailVerification";
  final String email;

  @override
  Widget build(BuildContext context) {
    return ApexScaffold(children: [
      ScreenTitle(
        title: 'Verify it\'s you',
        subTitle:
            'We send a code to ( *****@mail.com ). Enter it here to verify your identity',
      ),
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 20.0),
        child: OtpTextField(
          numberOfFields: 5,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          showCursor: false,
          fieldWidth: 60,
          textStyle: ApexTextStyles.kBlack16,
          showFieldAsBox: true,
          autoFocus: true,
          hasCustomInputDecoration: true,
          decoration: InputDecoration(
            filled: true,
            fillColor: ApexColors.lightGrey,
            counterText: '',
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.all(Radius.circular(15.0)),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: ApexColors.orange, width: 1.0),
              borderRadius: BorderRadius.all(Radius.circular(15.0)),
            ),
          ),
          onCodeChanged: (String code) {
            //handle validation or checks here
          },
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
      InkWell(
        onTap: (){
          //TODO: Resend OTP to email
        },
        child: Text(
          'Resend Code',
          style: ApexTextStyles.kOrange16,
        ),
      ),
      SizedBox(height: MediaQuery.of(context).size.height / 8,),
      ApexButton(onPressed: (){
        //TODO: confirm OTP
        Navigator.pushNamed(context, NewPasswordScreen.screenID);
      }, text: 'Confirm',),

    ]);
  }
}
