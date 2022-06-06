import 'package:flutter/cupertino.dart';
import '../../../models/user.dart';

class UserProvider with ChangeNotifier{
  User _user = User();
  User get user => _user;

  String _password = '';
  String get password => _password;

  setUserID({required String id}){
    _user.id = id;
    notifyListeners();
  }

  setUserFullName({required String fullName}){
    _user.fullName = fullName;
    notifyListeners();
  }

  setUserEmail({required String email}){
    _user.email = email;
    notifyListeners();
  }

  setUserName({required String name}){
    _user.userName = name;
    notifyListeners();
  }

  setUserPhone({required String phone}){
    _user.phone = phone;
    notifyListeners();
  }

  setUserCountry({required String code}){
    _user.country = code;
    notifyListeners();
  }

  setUserAvatar({required String avatar}){
    _user.avatar = avatar;
    notifyListeners();
  }

  setUserPassword({required String password}){
    _password = password;
    notifyListeners();
  }

  clearUserData(){
    _user = User();
    notifyListeners();
  }
}