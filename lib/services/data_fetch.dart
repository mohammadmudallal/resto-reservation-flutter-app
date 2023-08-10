import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:resto_reservation_app/%20cache/cacheHelper.dart';
import 'package:resto_reservation_app/models/category.dart';
import 'package:resto_reservation_app/models/menu.dart';
import 'package:resto_reservation_app/models/table.dart';

class FetchData {
  static String _url = "http://192.168.0.109:8000/api/";

  static Future<List<TableModel>> getTablesByDate({required String date}) async {
    List<TableModel> tables = [];
    dynamic token = cacheData.getData(key: 'token');
    http.Response response = await http.get(
      Uri.parse(_url+"get-tables/$date"),
      headers: <String, String>{
        "Accept": "application/vnd.api+json",
        "Content-Type": "application/vnd.api+json",
        "Authorization": "Bearer ${token}",
      },
    );

    var data = jsonDecode(response.body.toString());

    // tables.add(Table.fromJson(data[0]));
    // print(tables[0].name);
    if(response.statusCode == 200){
      for(var i in data){
        tables.add(TableModel.fromJson(i));
      }
    }
    return tables;

    // return tables;
  }

  static Future<List<TableModel>> getAllTables() async {
    List<TableModel> tables = [];
    dynamic token = cacheData.getData(key: 'token');
      http.Response response = await http.get(
        Uri.parse(_url+"tables"),
        headers: <String, String>{
          "Accept": "application/vnd.api+json",
          "Content-Type": "application/vnd.api+json",
          "Authorization": "Bearer ${token}",
        },
      );

      var data = jsonDecode(response.body.toString());

      // tables.add(Table.fromJson(data[0]));
      // print(tables[0].name);
      if(response.statusCode == 200){
        for(var i in data){
          tables.add(TableModel.fromJson(i));
        }
      }
      return tables;

    // return tables;
  }
  static Future<List<Category>> getAllCategories() async {
    List<Category> categories = [];
    dynamic token = cacheData.getData(key: 'token');
    try {
      http.Response response = await http.get(
        Uri.parse(_url + "categories"),
        headers: <String, String>{
          "Accept": "application/vnd.api+json",
          "Content-Type": "application/vnd.api+json",
          "Authorization": "Bearer ${token}",
        },
      );
      var data = jsonDecode(response.body.toString());
      if (response.statusCode == 200) {
        for (var i in data) {
          categories.add(Category.fromJson(i));
        }
      }
      return categories;
    } catch (e) {
      print("Error happened: $e");
    }
    return categories;
  }

  static Future<List<Menu>> getAllMenus() async {
    List<Menu> menus = [];
    dynamic token = cacheData.getData(key: 'token');
    try {
      http.Response response = await http.get(
        Uri.parse(_url + "categories/all-menus"),
        headers: <String, String>{
          "Accept": "application/vnd.api+json",
          "Content-Type": "application/vnd.api+json",
          "Authorization": "Bearer ${token}",
        },
      );
      var data = jsonDecode(response.body.toString());
      if (response.statusCode == 200) {
        for (var i in data) {
          menus.add(Menu.fromJson(i));
        }
      }
      return menus;
    } catch (e) {
      print("Error happened: $e");
    }
    return menus;
  }

  static Future<List<Menu>> getMenus(dynamic id) async {
    List<Menu> menus = [];
    dynamic token = cacheData.getData(key: 'token');
    try {
      http.Response response = await http.get(
        Uri.parse(_url + "categories/menus/$id"),
        headers: <String, String>{
          "Accept": "application/vnd.api+json",
          "Content-Type": "application/vnd.api+json",
          "Authorization": "Bearer ${token}",
        },
      );
      var data = jsonDecode(response.body.toString());
      if (response.statusCode == 200) {
        for (var i in data) {
          menus.add(Menu.fromJson(i));
        }
      }
      return menus;
    } catch (e) {
      print("Error happend: $e");
    }
    return menus;
  }


}
