import 'package:apex/components/apex_button.dart';
import 'package:apex/components/apex_scaffold.dart';
import 'package:apex/components/screen_title.dart';
import 'package:apex/constants/color_constants.dart';
import 'package:apex/screens/authentication/pin_created_screen.dart';
import 'package:apex/utilities/alert_handler.dart';
import 'package:apex/utilities/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:provider/provider.dart';
import '../../constants/text_styles.dart';
import '../../models/user.dart';
import '../../utilities/provider/providers/loading_provider.dart';
import '../../utilities/provider/providers/user_provider.dart';
import '../../utilities/shared_pref.dart';

class PinCodeScreen extends StatelessWidget {
  const PinCodeScreen({Key? key}) : super(key: key);
  static const screenID = "PinCode";

  @override
  Widget build(BuildContext context) {
    return ApexScaffold(
      bottomNavBar: ApexButton(
        onPressed: () {
          createUserAccount(context);
        },
        text: 'Create PIN',
      ),
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
            onSubmit: (_) async {
             createUserAccount(context);
            }, // end onSubmit
          ),
        ),
      ],
    );
  }
  void createUserAccount(BuildContext context) async {
    final loader = Provider.of<LoadingStateProvider>(context, listen: false);
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    try {
      loader.load();
      User user = await AuthService().createUser(
        email: userProvider.user.email,
        fullName: userProvider.user.fullName,
        password: userProvider.password,
        country: userProvider.user.country,
        username: '',
      );
      userProvider.setUserToken(token: user.token);
      Shared.setString(Shared.userToken, user.token);
      loader.stop();
      AlertHandler.showPopup(
        context: context,
        alert: 'Your pin has been created. Please go to the dashboard',
        onPressed: () => Navigator.pushNamed(context, PinCreatedScreen.screenID),
      );
    } catch (_) {
      loader.stop();
      AlertHandler.showErrorPopup(
        context: context,
        error:
        'An error occurred while creating your pin. Please try again',
      );
    }
  }
}
