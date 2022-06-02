import 'package:flutter/material.dart';
import '../constants/color_constants.dart';


class ApexButton extends StatelessWidget {
  final Function() onPressed;
  final String text;
  final Color textColor;
  final Color backgroundColor;

  const ApexButton({
    required this.onPressed,
    required this.text,
    this.textColor = ApexColors.white,
    this.backgroundColor = ApexColors.black,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Material(
        color: backgroundColor,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
            side: BorderSide(
              color: ApexColors.grey,
              width: 2.0,
            )
        ),
        child: MaterialButton(
          onPressed: onPressed,
          minWidth: double.infinity,
          height: 50.0,
          child: Text(
            text,
            style: TextStyle(
              color: textColor,
              fontWeight: FontWeight.bold,
              fontSize: 16.0,
              //fontFamily: kPoppins,
            ),
          ),
        ),
      ),
    );
  }
}
