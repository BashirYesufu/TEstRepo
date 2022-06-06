import 'package:apex/components/apex_scaffold.dart';
import 'package:apex/constants/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/user.dart';
import '../utilities/provider/providers/user_provider.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({required this.user, Key? key}) : super(key: key);
  static const screenID = "DashBoard";
  final User user;

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {

  @override
  void initState() {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    print(userProvider.token);
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return ApexScaffold(
      hasBackButton: false,
      children: [
        Center(
          child: Text(
            'Welcome to the Dashboard',
            style: ApexTextStyles.kOrange16,
          ),
        ),
      ],
    );
  }


}
