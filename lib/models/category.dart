import 'package:resto_reservation_app/services/data_fetch.dart';

class Category {
  dynamic? id;
  String? name;
  String? image;
  String? description;
  String? created_at;
  String? updated_at;

  Category({required this.id, required this.name, required this.image, required this.description, required this.created_at,
      required this.updated_at});


  Category.fromJson(dynamic json) {
    id =  json['id'] ?? '';
    name = json['name'] ?? '';
    image = json['image'] ?? '';
    description = json['description'] ?? '';
    created_at = json['created_at'] ?? '';
    updated_at = json['updated_at'] ?? '';
  }

}
