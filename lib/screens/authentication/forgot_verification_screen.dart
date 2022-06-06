import 'package:apex/components/apex_button.dart';
import 'package:apex/components/apex_scaffold.dart';
import 'package:apex/components/screen_title.dart';
import 'package:apex/constants/color_constants.dart';
import 'package:apex/constants/text_styles.dart';
import 'package:apex/screens/authentication/new_password_screen.dart';
import 'package:apex/utilities/alert_handler.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:provider/provider.dart';
import '../../utilities/provider/providers/loading_provider.dart';


class ForgotVerificationScreen extends StatelessWidget {
  ForgotVerificationScreen({Key? key}) : super(key: key);
  static const screenID = "ForgotVerification";

  @override
  Widget build(BuildContext context) {
    final loader = Provider.of<LoadingStateProvider>(context);
    return ApexScaffold(
      children: [
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
            //runs when every textfield is filled
            onSubmit: (String verificationCode) async {
                  AlertHandler.showPopup(
                    context: context,
                    hasCloseButton: true,
                    alert:
                    'Your email has been verified. Please create a new password',
                    onPressed: () => Navigator.pushNamed(context, NewPasswordScreen.screenID),
                  );
            }, // end onSubmit
          ),
        ),
        InkWell(
          onTap: () async {
            loader.load();
            Future.delayed(Duration(seconds: 2));
            loader.stop();
            AlertHandler.showPopup(
              context: context,
              hasCloseButton: false,
              alert:
              'Another token has been sent to your mail, '
                  'Enter it here to verify your identity',
            );
          },
          child: Text(
            'Resend Code',
            style: ApexTextStyles.kOrange16,
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height / 8,
        ),
        ApexButton(
          onPressed: () {
            AlertHandler.showPopup(
              context: context,
              hasCloseButton: false,
              alert:
              'Your email has been verified. Please create a new password',
              onPressed: () => Navigator.pushNamed(context, NewPasswordScreen.screenID),
            );
          },
          text: 'Confirm',
        ),
      ],
    );
  }
}
