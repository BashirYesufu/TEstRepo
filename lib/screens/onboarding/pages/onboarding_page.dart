import 'package:flutter/material.dart';
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
                            Color(0xFFFFFFFF).withOpacity(0),
                            Color(0xFFFFFFFF).withOpacity(0),
                            Color(0xFFFFFFFF).withOpacity(0.6),
                            Color(0xFFFFFFFF).withOpacity(1),
                          ],
                          stops: const [
                            0.0,
                            0.3,
                            0.7,
                            1.0
                          ])),
                )
              ],
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(title,
                  style: ApexTextStyles.kBlackBold24,
                  textAlign: TextAlign.center,),
                SizedBox(height: 30,),
                Text(subtitle,
                  style: ApexTextStyles.kGrey14,
                  textAlign: TextAlign.center,)
              ],
            )
          ],
        ),
      ),
    );
  }
}
