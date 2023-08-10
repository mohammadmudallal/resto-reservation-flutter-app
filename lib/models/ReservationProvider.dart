import 'dart:collection';

import 'package:flutter/material.dart';

class ReservationProvider extends ChangeNotifier{
  dynamic _user_id = 0;
  String _name = '';
  String _email = '';
  String _phone = '';
  dynamic _guests = 0;
  String _date= '';

  // List<Widget> _reservationInfo = [];
  //
  // UnmodifiableListView<Widget> get reservations{
  //   return UnmodifiableListView(_reservationInfo);
  // }
  //
  // int getReservationInfoLength(){
  //   return _reservationInfo.length;
  // }
  // void addReservationCard(Widget widget){
  //   _reservationInfo.add(widget);
  //   notifyListeners();
  // }

  void setReservationData({
    required dynamic user_id,
    required String name,
    required String email,
    required String phone,
    required dynamic guests,
    required String date
  }){
    _user_id =user_id;
    _name = name;
    _email = email;
    _phone = phone;
    _guests = guests;
    _date = date;
    notifyListeners();
  }

  String get name => _name;

  dynamic getUserId(){
    return _user_id!;
  }
  String getnName(){
    return _name!;
  }
  String getEmail(){
    return _email!;
  }
  String getPhone(){
    return _phone!;
  }
  dynamic getGuests(){
    return _guests!;
  }
  String getDate(){
    return _date!;
  }
}