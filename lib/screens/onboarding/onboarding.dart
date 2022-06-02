import 'package:apex/components/apex_button.dart';
import 'package:flutter/material.dart';
import '../../components/apex_scaffold.dart';

class OnBoarding extends StatelessWidget {
  const OnBoarding({Key? key}) : super(key: key);
  static const screenID = "OnBoarding";

  @override
  Widget build(BuildContext context) {
    return ApexScaffold(children: [
      ApexButton(onPressed: (){}, text: "text"),
    ],);
  }
}
