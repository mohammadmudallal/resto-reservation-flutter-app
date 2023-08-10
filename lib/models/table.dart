import 'package:resto_reservation_app/services/data_fetch.dart';

class TableModel {
  dynamic? id;
  String? name;
  dynamic? guest_number;
  String? location;
  String? status;
  String? created_at;
  String? updated_at;

  TableModel({required this.id, required this.name, required this.guest_number, required this.location,required this.status, required this.created_at,
    required this.updated_at});


  TableModel.fromJson(dynamic json) {
    id = json['id'] ?? '';
    name = json['name'] ?? '';
    guest_number = json['guest_number'] ?? '';
    location = json['location'] ?? '';
    status = json['status'] ?? '';
    created_at = json['created_at'] ?? '';
    updated_at = json['updated_at'] ?? '';
  }

}
