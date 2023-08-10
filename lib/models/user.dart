import 'dart:convert';

import 'package:flutter/cupertino.dart';

class User extends ChangeNotifier{
  dynamic _id = 0;
  String? _name = '';
  String? _email = '';
  String? _token = '';

  void setData(dynamic id, String name, String email, String token){
    _id = id;
    _name = name;
    _email = email;
    _token = token;
    notifyListeners();
  }


  dynamic getId(){
    return _id!;
  }

  String getName(){
    return _name!;
  }

  String getEmail(){
    return _email!;
  }

  String getToken(){
    return _token!;
  }

}