import 'package:apex/utilities/provider/providers/loading_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class ProviderList {
  static final List<ChangeNotifierProvider<ChangeNotifier>> providers = [
    ChangeNotifierProvider<LoadingStateProvider>(
      create: (BuildContext context) => LoadingStateProvider(),
    ),
  ];
}