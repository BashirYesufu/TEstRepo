import 'package:flutter/material.dart';
import '../constants/text_styles.dart';

class ScreenTitle extends StatelessWidget {
  final String title;
  final String subTitle;
  final CrossAxisAlignment crossAxisAlignment;
  final TextAlign textAlign;

  const ScreenTitle({
    required this.title,
    required this.subTitle,
    this.crossAxisAlignment = CrossAxisAlignment.start,
    this.textAlign = TextAlign.left,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 30.0),
      child: Column(
        crossAxisAlignment: crossAxisAlignment,
        children: [
          Text(
            title,
            textAlign: textAlign,
            style: ApexTextStyles.kBlackBold28,
          ),
          SizedBox(
            height: 10.0,
          ),
          Row(
            children: [
              Flexible(
                  child: Text(
                subTitle,
                textAlign: textAlign,
                style: ApexTextStyles.kDarkGrey16,
              )),
            ],
          )
        ],
      ),
    );
  }
}
