import 'package:apex/utilities/provider/providers/country_picker_provider.dart';
import 'package:apex/utilities/provider/providers/loading_provider.dart';
import 'package:apex/utilities/provider/providers/user_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class ProviderList {
  static final List<ChangeNotifierProvider<ChangeNotifier>> providers = [
    ChangeNotifierProvider<LoadingStateProvider>(
      create: (BuildContext context) => LoadingStateProvider(),
    ),
    ChangeNotifierProvider<CountryPickerProvider>(
      create: (BuildContext context) => CountryPickerProvider(),
    ),
    ChangeNotifierProvider<UserProvider>(
      create: (BuildContext context) => UserProvider(),
    ),
  ];
}