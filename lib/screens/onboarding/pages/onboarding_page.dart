import 'package:flutter/material.dart';
import '../../../constants/color_constants.dart';
import '../../../constants/text_styles.dart';

class OnBoardingPage extends StatelessWidget {
  final Image bottom;
  final Image top;
  final String title;
  final String subtitle;
  final AlignmentGeometry alignment;
  const OnBoardingPage({
    required this.bottom,
    required this.top,
    required this.title,
    required this.subtitle,
    required this.alignment,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Stack(
          alignment: AlignmentDirectional.bottomCenter,
          children: [
            Stack(
              children: [
                Center(
                  child: Stack(
                    alignment: alignment,
                    children: [
                      bottom,
                      top,
                    ],
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(20)),
                      boxShadow: [
                        BoxShadow(
                          color: Color(0xFFFFFFFF),
                          offset: const Offset(0, 260),
                          blurRadius: 30,
                          spreadRadius: -10,
                        ),
                      ],
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            ApexColors.white.withOpacity(0),
                            ApexColors.white.withOpacity(0),
                            ApexColors.white.withOpacity(0.3),
                            ApexColors.white.withOpacity(0.5),
                            ApexColors.white,
                          ]
                      ),),
                )
              ],
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(title,
                  style: ApexTextStyles.kBlackBold28,
                  textAlign: TextAlign.center,),
                SizedBox(height: 30,),
                Text(subtitle,
                  style: ApexTextStyles.kDarkGrey14,
                  textAlign: TextAlign.center,)
              ],
            )
          ],
        ),
      ),
    );
  }
}
