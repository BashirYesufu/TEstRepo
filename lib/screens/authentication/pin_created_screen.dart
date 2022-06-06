import 'package:apex/components/apex_scaffold.dart';
import 'package:flutter/material.dart';
import '../../components/apex_button.dart';
import '../../components/screen_title.dart';
import '../../constants/apex_images.dart';
import '../dashboard.dart';

class PinCreatedScreen extends StatelessWidget {
  const PinCreatedScreen({Key? key}) : super(key: key);
  static const screenID = "PinCreated";

  @override
  Widget build(BuildContext context) {
    return ApexScaffold(
      hasBackButton: false,
      bottomNavBar: ApexButton(
        onPressed: () {
          Navigator.pushNamed(context, DashBoard.screenID);
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
