import 'package:apex/components/apex_scaffold.dart';
import 'package:apex/screens/user_arguments.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../components/apex_button.dart';
import '../../components/screen_title.dart';
import '../../constants/apex_images.dart';
import '../../utilities/provider/providers/user_provider.dart';
import '../dashboard.dart';

class PinCreatedScreen extends StatelessWidget {
  const PinCreatedScreen({Key? key}) : super(key: key);
  static const screenID = "PinCreated";

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    return ApexScaffold(
      hasBackButton: false,
      bottomNavBar: ApexButton(
        onPressed: () {
          Navigator.pushReplacementNamed(context, DashBoard.screenID, arguments: UserArguments(user: userProvider.user));
        },
        text: 'Proceed to home',
      ),
      children: [
        Padding(
          padding: const EdgeInsets.all(30.0),
          child: Image.asset(ApexImages.pinCreated),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ScreenTitle(
            title: 'Congratulations',
            subTitle: 'Hey ${userProvider.user.fullName}, your account has been successfully created 👋',
            crossAxisAlignment: CrossAxisAlignment.center,
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
