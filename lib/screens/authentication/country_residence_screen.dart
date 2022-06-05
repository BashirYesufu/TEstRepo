import 'package:apex/components/apex_button.dart';
import 'package:apex/components/apex_scaffold.dart';
import 'package:apex/components/apex_textfield.dart';
import 'package:apex/components/screen_title.dart';
import 'package:apex/screens/authentication/pin_code_screen.dart';
import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';

import '../../constants/color_constants.dart';
import '../../constants/text_styles.dart';

class CountryResidence extends StatefulWidget {
  const CountryResidence({Key? key}) : super(key: key);
  static const screenID = "CountryResidence";

  @override
  State<CountryResidence> createState() => _CountryResidenceState();
}

class _CountryResidenceState extends State<CountryResidence> {
  @override
  Widget build(BuildContext context) {

    String emoji = '🇦🇫';
    return ApexScaffold(
      bottomNavBar: ApexButton(
        onPressed: (){
          Navigator.pushNamed(context, PinCodeScreen.screenID);
        },
        text: 'Continue',
      ),
      children: [
        ScreenTitle(
          title: 'Country of residence',
          subTitle:
              'Please select all the countries that you’re a tax resident in',
        ),
        ApexTextField(
          readOnly: true,
          controller: TextEditingController(text: emoji),
          onTap: (){
            showCountryPicker(
              context: context,
              showPhoneCode: false,
              countryListTheme: CountryListThemeData(
                bottomSheetHeight: MediaQuery.of(context).size.height / 1.5,
                flagSize: 30,
                inputDecoration: InputDecoration(
                  hintStyle: ApexTextStyles.kAsh16,
                  hintText: 'Search',
                  filled: true,
                  fillColor: ApexColors.lightGrey,
                  contentPadding: EdgeInsets.all(20.0),
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.all(Radius.circular(20.0),),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: ApexColors.orange, width: 1.0),
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  ),
                ),
              ),
              onSelect: (Country country) {
                setState(() {
                  emoji = country.flagEmoji + country.displayName;
                });
                print(country.flagEmoji);
                print('Select country: ${country.displayName}');
              },
            );
          },
        )
      ],
    );
  }
}
