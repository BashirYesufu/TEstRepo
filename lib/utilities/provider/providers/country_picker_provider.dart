import 'package:flutter/cupertino.dart';

class CountryPickerProvider with ChangeNotifier{
  String _countryName = '';
  String get country => _countryName;
  String _countryFlag = '';
  String get flag => _countryFlag;
  String _countryCode = '';
  String get countryCode => _countryCode;

  setCountry({required String countryFlag, required String countryName, required String countryCode}){
    _countryName = countryName;
    _countryFlag = countryFlag;
    _countryCode = countryCode;
    notifyListeners();
  }

  clearCountryDetails(){
    _countryName = '';
    _countryFlag = '';
    _countryCode = '';
    notifyListeners();
  }
}