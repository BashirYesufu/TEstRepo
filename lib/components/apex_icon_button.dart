import 'package:flutter/material.dart';
import '../constants/color_constants.dart';
import 'apex_button.dart';

class ApexIconButton extends StatelessWidget {
  final Widget child;
  const ApexIconButton({
    this.child = const SizedBox(),
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          ApexButton(
            onPressed: () {},
            text: "",
            backgroundColor: ApexColors.white,
            borderColor: ApexColors.grey,
          ),
          child
        ],
      ),
    );
  }
}
