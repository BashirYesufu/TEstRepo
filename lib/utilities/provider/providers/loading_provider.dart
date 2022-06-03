import 'package:flutter/cupertino.dart';

class LoadingStateProvider with ChangeNotifier{
  bool _loading = false;
  bool get loading => _loading;

  load(){
    _loading = true;
    notifyListeners();
  }

  stop(){
    _loading = false;
    notifyListeners();
  }
}