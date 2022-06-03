import 'package:apex/constants/text_styles.dart';
import 'package:flutter/material.dart';
import '../constants/color_constants.dart';

class ApexButton extends StatelessWidget {
  final Function() onPressed;
  final String text;
  final Color backgroundColor;
  final bool enabled;
  final Color borderColor;

  const ApexButton({
    required this.onPressed,
    required this.text,
    this.backgroundColor = ApexColors.black,
    this.borderColor = ApexColors.black,
    this.enabled = true,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Material(
        color: enabled ? backgroundColor : ApexColors.lightBlack,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
            side: BorderSide(
              color: enabled ? borderColor : ApexColors.lightBlack,
              width: 1.0,
            )
        ),
        child: MaterialButton(
          onPressed: onPressed,
          minWidth: double.infinity,
          height: 56.0,
          child: Text(
            text,
            style: ApexTextStyles.kWhiteBold16
          ),
        ),
      ),
    );
  }
}
