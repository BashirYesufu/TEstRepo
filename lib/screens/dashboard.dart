import 'package:apex/components/apex_scaffold.dart';
import 'package:flutter/material.dart';
import '../models/user.dart';

class DashBoard extends StatelessWidget {
  const DashBoard({
    required this.user,
    Key? key}) : super(key: key);
  static const screenID = "DashBoard";
  final User user;

  @override
  Widget build(BuildContext context) {
    return ApexScaffold(children: []);
  }
}
