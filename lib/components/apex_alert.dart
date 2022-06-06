import 'package:apex/components/apex_button.dart';
import 'package:apex/constants/apex_images.dart';
import 'package:apex/constants/color_constants.dart';
import 'package:apex/constants/text_styles.dart';
import 'package:flutter/material.dart';

class ApexAlert extends StatelessWidget {
  const ApexAlert({
    required this.alert,
    this.onPressed,
    this.isError = false,
    this.hasCloseButton = true,
    Key? key,
  }) : super(key: key);

  final String alert;
  final Function()? onPressed;
  final bool isError;
  final bool hasCloseButton;

  @override
  Widget build(BuildContext context) {
    return CustomDialog(children: [
      hasCloseButton ? Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(Icons.close),
          )
        ],
      ) : SizedBox(),
      Text(
        'Apex Finance',
        style: ApexTextStyles.kOrangeBold28,
      ),
      Padding(
        padding: const EdgeInsets.all(30.0),
        child: Image.asset(
          ApexImages.diamond,
          width: 100,
          height: 100,
        ),
      ),
      Text(
        alert,
        style: isError ? ApexTextStyles.kRed16 : ApexTextStyles.kBlack16,
        textAlign: TextAlign.center,
      ),
      SizedBox(
        height: 30,
      ),
      ApexButton(
        onPressed: onPressed ?? () => Navigator.pop(context),
        text: 'Ok',
      ),
    ]);
  }
}

class CustomDialog extends StatelessWidget {
  final List<Widget> children;

  const CustomDialog({required this.children, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: EdgeInsets.all(25.0),
      backgroundColor: ApexColors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Container(
        padding: const EdgeInsets.all(10.0),
        margin: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.min,
          children: children,
        ),
      ),
    );
  }
}
