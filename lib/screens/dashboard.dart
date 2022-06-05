import 'package:apex/components/apex_scaffold.dart';
import 'package:apex/constants/text_styles.dart';
import 'package:flutter/material.dart';
import '../models/user.dart';

class DashBoard extends StatelessWidget {
  const DashBoard({required this.user, Key? key}) : super(key: key);
  static const screenID = "DashBoard";
  final User user;

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
