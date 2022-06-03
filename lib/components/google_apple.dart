import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../constants/apex_images.dart';
import '../constants/color_constants.dart';
import '../constants/text_styles.dart';
import 'apex_icon_button.dart';


class GoogleApple extends StatelessWidget {
  const GoogleApple({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: 30.0),
          child: Row(
            children: [
              Flexible(
                child: Container(
                  height: 2,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: [
                          ApexColors.white,
                          ApexColors.grey
                        ]
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.0),
                child: Text('OR', style: ApexTextStyles.kDarkGrey16,),
              ),
              Flexible(
                child: Container(
                  height: 2,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: [
                          ApexColors.grey,
                          ApexColors.white,
                        ]
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Row(
          children: [
            ApexIconButton(
              child: Image.asset(ApexImages.google, height: 30, width: 30,),
            ),
            SizedBox(width: 20,),
            ApexIconButton(
              child: FaIcon(FontAwesomeIcons.apple, size: 30,),
            ),
          ],
        )
      ],
    );
  }
}
