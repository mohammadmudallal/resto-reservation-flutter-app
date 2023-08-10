import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:resto_reservation_app/%20cache/cacheHelper.dart';
import 'package:resto_reservation_app/pages/login_page.dart';
import 'package:resto_reservation_app/models/user.dart';
import 'package:flutter/material.dart';
import 'package:resto_reservation_app/main_page.dart';

class Authentication {
  final String _url = "http://192.168.0.109:8000/api/";

  void signin(
      {required String e,
      required String p,
      required BuildContext context}) async {
    try {
      http.Response response = await http.post(
        Uri.parse(_url + "login"),
        headers: <String, String>{
          "Accept": "application/vnd.api+json",
          "Content-Type": "application/vnd.api+json",
        },
        body: jsonEncode(<String, dynamic>{
          "email": e,
          "password": p,
        }),
      );

      if (response.statusCode == 200) {
        if (await cacheData.setData(
            key: 'token', value: jsonDecode(response.body)['token'])) {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const MainPage()));
          Provider.of<User>(context, listen: false).setData(
              jsonDecode(response.body)['id'],
              jsonDecode(response.body)['name'],
              jsonDecode(response.body)['email'],
              jsonDecode(response.body)['token']);
        }
      }
      print(response.statusCode);
    } catch (e) {
      print("error happened: $e");
    }
  }

  void logout({required BuildContext context}) async {
    dynamic token = cacheData.getData(key: 'token');
    print(token);
    http.Response response = await http.post(
      Uri.parse(_url + "logout"),
      headers: <String, String>{
        "Accept": "application/vnd.api+json",
        "Content-Type": "application/vnd.api+json",
        "Authorization": "Bearer ${token}",
      },
    );

    print(response.statusCode);
    if (response.statusCode == 200) {
      cacheData.deleteItem(key: 'token');
    }
  }

  void signUp(
      {required String name,
      required String email,
      required String password,
      required String password_confirmation,
      required BuildContext context}) async {
    try {
      http.Response response = await http.post(
        Uri.parse(_url + "register"),
        headers: <String, String>{
          "Accept": "application/vnd.api+json",
          "Content-Type": "application/vnd.api+json",
        },
        body: jsonEncode(<String, dynamic>{
          "name": name,
          "email": email,
          "password": password,
          "password_confirmation": password_confirmation
        }),
      );
      if (response.statusCode == 200) {
        SnackBar snackBar = SnackBar(
            content: Text(
                'Your account was successfully created! You can login to continue'));
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      } else if (response.statusCode == 422) {
        SnackBar snackBar =
            SnackBar(content: Text(jsonDecode(response.body)['message']));
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
    } catch (e) {
      print("error happened: $e");
    }
  }
}
