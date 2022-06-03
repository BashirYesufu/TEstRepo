import 'package:apex/constants/color_constants.dart';
import 'package:apex/constants/string_literals.dart';
import 'package:flutter/material.dart';

class ApexTextStyles {
  static const kBlackBold24 = TextStyle(
      fontFamily: ApexFonts.sfProDisplay,
      color: ApexColors.black,
      fontSize: 24.0,
      fontWeight: FontWeight.w900
  );
  static const kGrey14 = TextStyle(
      fontFamily: ApexFonts.sfProDisplay,
      color: ApexColors.darkGrey,
      fontSize: 14.0,
  );
  static const kOrange16 = TextStyle(
    fontFamily: ApexFonts.sfProDisplay,
    color: ApexColors.orange,
    fontSize: 16.0,
    fontWeight: FontWeight.w600
  );
}