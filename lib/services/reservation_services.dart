import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:resto_reservation_app/%20cache/cacheHelper.dart';
import 'package:resto_reservation_app/models/my_reservation.dart';

class ReservationServices {
  static String _url = "http://192.168.0.109:8000/api/";

  static Future<List<ReservationData>> getMyReservations() async{
    List<ReservationData> reservations = [];
    dynamic token = cacheData.getData(key: 'token');

    try{
      http.Response response = await http.get(
        Uri.parse(_url+"getMyReservations"),
        headers: <String, String>{
          "Accept": "application/vnd.api+json",
          "Content-Type": "application/vnd.api+json",
          "Authorization": "Bearer ${token}",
        },
      );
      var data = jsonDecode(response.body.toString());
      if(response.statusCode == 200){
        for(var i in data){
          reservations.add(ReservationData.fromJson(i));
        }
      }
      return reservations;
    }catch(e){
      print('Error happened: $e');
    }
    return reservations;
  }
  static void makeReservationRequest({
    required BuildContext context,
    required dynamic user_id,
    required dynamic table_id,
    required dynamic date,
  }) async {
    dynamic token = cacheData.getData(key: 'token');
    try {
      http.Response response = await http.post(
        Uri.parse(_url + "make-reservation"),
        headers: <String, String>{
          "Accept": "application/vnd.api+json",
          "Content-Type": "application/vnd.api+json",
          "Authorization": "Bearer ${token}",
        },
        body: jsonEncode(<String, dynamic>{
          "user_id": user_id,
          "table_id":table_id,
          "date": date
        }),
      );
      if(response.statusCode == 200){
        print('Done');
      }
    } catch (e) {
      print("Error happened: $e");
    }
  }
}
