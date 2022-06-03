import 'package:flutter/material.dart';
import '../constants/text_styles.dart';

class ScreenTitle extends StatelessWidget {
  final String title;
  final String subTitle;

  const ScreenTitle({
    required this.title,
    required this.subTitle,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 30.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            textAlign: TextAlign.left,
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
                textAlign: TextAlign.left,
                style: ApexTextStyles.kDarkGrey16,
              )),
            ],
          )
        ],
      ),
    );
  }
}
