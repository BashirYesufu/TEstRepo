import 'package:apex/components/apex_scaffold.dart';
import 'package:apex/constants/text_styles.dart';
import 'package:apex/screens/authentication/sign_in_screen.dart';
import 'package:apex/utilities/services/auth_service.dart';
import 'package:apex/utilities/services/dashboard_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/user.dart';
import '../utilities/alert_handler.dart';
import '../utilities/provider/providers/loading_provider.dart';

class DashBoard extends StatelessWidget {
  DashBoard({required this.user, Key? key}) : super(key: key);
  static const screenID = "DashBoard";
  final User user;

  @override
  Widget build(BuildContext context) {
    final loader = Provider.of<LoadingStateProvider>(context);
    return ApexScaffold(
      hasBackButton: false,
      trailing: [
        Transform.translate(
          offset: Offset(-20.0, 20.0),
          child: InkWell(
            onTap: () async {
              try {
                loader.load();
                bool logged = await AuthService().logOutUser(email: user.email);
                loader.stop();
                if (logged) {
                  AlertHandler.showPopup(
                    context: context,
                    alert: 'Signed out ${user.fullName}',
                    hasCloseButton: false,
                    onPressed: () => Navigator.of(context)
                        .pushReplacementNamed(SignInScreen.screenID),
                  );
                }
              } catch (_) {
                loader.stop();
                AlertHandler.showErrorPopup(
                    context: context,
                    error:
                        'Error signing out user. Please check your connection and try again.');
              }
            },
            child: Text(
              'Logout',
              style: ApexTextStyles.kOrange16,
            ),
          ),
        )
      ],
      children: [
        Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0),
            child: Text(
              'Welcome to the Dashboard',
              style: ApexTextStyles.kOrange16,
            ),
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height / 3,
        ),
        FutureBuilder<String>(
          future: DashBoardService().getDashBoardSecret(token: user.token),
          // function where api call is made
          builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: Text(
                  'Loading...',
                  style: ApexTextStyles.kOrangeBold28,
                ),
              );
            } else {
              if (snapshot.hasData) {
                //loader.stop();
                return Center(
                  child: Text(
                    '${snapshot.data}',
                    style: ApexTextStyles.kBlack16,
                    textAlign: TextAlign.center,
                  ),
                );
              } else {
                //loader.stop();
                return Center(
                  child: Text(
                    'Error getting dashboard secrets',
                    style: ApexTextStyles.kBlack16,
                    textAlign: TextAlign.center,
                  ),
                );
              } // snapshot.data  :- get your object which is pass from your downloadData() function
            }
          },
        ),
      ],
    );
  }
}
