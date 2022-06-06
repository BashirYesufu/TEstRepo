import 'package:apex/components/apex_button.dart';
import 'package:apex/components/apex_scaffold.dart';
import 'package:apex/components/apex_textfield.dart';
import 'package:apex/components/screen_title.dart';
import 'package:apex/screens/authentication/pin_code_screen.dart';
import 'package:apex/utilities/provider/providers/country_picker_provider.dart';
import 'package:apex/utilities/provider/providers/user_provider.dart';
import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../constants/color_constants.dart';
import '../../constants/text_styles.dart';
import '../../utilities/alert_handler.dart';

class CountryResidenceScreen extends StatelessWidget {
  const CountryResidenceScreen({Key? key}) : super(key: key);
  static const screenID = "CountryResidence";

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    return ApexScaffold(
      onBackPressed: (){
        final countryProvider = Provider.of<CountryPickerProvider>(context, listen: false);
        countryProvider.clearCountryDetails();
        Navigator.pop(context);
      },
      bottomNavBar: Consumer<CountryPickerProvider>(
        builder: (context, provider, _) => ApexButton(
          onPressed: () {
            if (provider.countryCode.isNotEmpty) {
              userProvider.setUserCountry(code: provider.countryCode);
              Navigator.pushNamed(context, PinCodeScreen.screenID);
            } else {
              AlertHandler.showErrorPopup(
                context: context,
                error: 'Please select a country',
              );
            }
          },
          text: 'Continue',
        ),
      ),
      children: [
        ScreenTitle(
          title: 'Country of residence',
          subTitle:
              'Please select all the countries that you’re a tax resident in',
        ),
        Consumer<CountryPickerProvider>(
          builder: (context, provider, _) => ApexTextField(
            suffix: Icon(Icons.keyboard_arrow_down, color: ApexColors.darkGrey,),
            readOnly: true,
            controller: TextEditingController(
                text: '${provider.flag} ${provider.country}'),
            onTap: () {
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
                      borderRadius: BorderRadius.all(
                        Radius.circular(20.0),
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: ApexColors.orange, width: 1.0),
                      borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    ),
                  ),
                ),
                onSelect: (Country country) {
                  provider.setCountry(
                    countryFlag: country.flagEmoji,
                    countryName: country.name,
                    countryCode: country.countryCode,
                  );
                  userProvider.setUserCountry(code: country.countryCode);
                },
              );
            },
          ),
        ),
      ],
    );
  }
}
