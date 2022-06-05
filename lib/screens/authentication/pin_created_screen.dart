import 'package:apex/components/apex_scaffold.dart';
import 'package:flutter/material.dart';
import '../../components/apex_button.dart';
import '../../components/screen_title.dart';
import '../../constants/apex_images.dart';

class PinCreatedScreen extends StatelessWidget {
  const PinCreatedScreen({Key? key}) : super(key: key);
  static const screenID = "PinCreated";

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
          child: Image.asset(ApexImages.pinCreated),
        ),
        ScreenTitle(
          title: 'Congratulations',
          subTitle: 'Hey Name, your password has been successfully updated.',
          crossAxisAlignment: CrossAxisAlignment.center,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
