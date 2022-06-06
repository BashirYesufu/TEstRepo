import 'package:apex/components/apex_button.dart';
import 'package:apex/components/apex_scaffold.dart';
import 'package:apex/components/screen_title.dart';
import 'package:apex/constants/color_constants.dart';
import 'package:apex/constants/text_styles.dart';
import 'package:apex/screens/authentication/country_residence_screen.dart';
import 'package:apex/utilities/alert_handler.dart';
import 'package:apex/utilities/provider/providers/user_provider.dart';
import 'package:apex/utilities/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:provider/provider.dart';
import '../../utilities/provider/providers/loading_provider.dart';

class EmailVerificationScreen extends StatelessWidget {
  EmailVerificationScreen({Key? key}) : super(key: key);
  static const screenID = "EmailVerification";

  @override
  Widget build(BuildContext context) {
    String token = '';
    final loader = Provider.of<LoadingStateProvider>(context);
    final userProvider = Provider.of<UserProvider>(context);
    return ApexScaffold(
      children: [
        ScreenTitle(
          title: 'Verify it\'s you',
          subTitle:
              'We sent a code to ( ${userProvider.user.email} ). Enter it here to verify your identity',
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
              token = verificationCode;
              try {
                loader.load();
                await AuthService()
                    .verifyEmailToken(email: userProvider.user.email, token: token);
                loader.stop();
                AlertHandler.showPopup(
                  context: context,
                  alert:
                      'Your email has been verified. Please select your country',
                  onPressed: () => Navigator.pushNamed(context, CountryResidenceScreen.screenID),
                );
              } catch (e) {
                loader.stop();
                AlertHandler.showErrorPopup(
                  context: context,
                  error:
                      'An error occurred while verifying your email. Please try again',
                );
              }
            }, // end onSubmit
          ),
        ),
        InkWell(
          onTap: () async {
            try {
              loader.load();
              String token = await AuthService().getEmailToken(email: userProvider.user.email);
              loader.stop();
              AlertHandler.showPopup(
                  context: context,
                  alert:
                      'Another token has been sent to ${userProvider.user.email}, '
                          'Enter it here to verify your identity $token',);
            } catch (_) {
              loader.stop();
              AlertHandler.showErrorPopup(
                  context: context,
                  error:
                      'An error occurred while sending you an OTP. Please try again',);
            }
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
          onPressed: () async {
            try {
              loader.load();
              await AuthService()
                  .verifyEmailToken(email: userProvider.user.email, token: token);
              loader.stop();
              AlertHandler.showPopup(
                context: context,
                alert:
                    'Your email has been verified. Please select your country',
                onPressed: () => Navigator.pushNamed(context, CountryResidenceScreen.screenID),
              );
            } catch (e) {
              loader.stop();
              AlertHandler.showErrorPopup(
                context: context,
                error:
                    'An error occurred while verifying your email. Please try again',
              );
            }
          },
          text: 'Confirm',
        ),
      ],
    );
  }
}
