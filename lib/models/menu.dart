

class Menu{
  dynamic? id;
  dynamic? cat_id;
  String? name;
  String? image;
  String? price;
  String? description;
  dynamic? created_at;
  dynamic? updated_at;
  String? category_name;

  Menu({required this.id, required this.cat_id,
    required this.name, required this.image,
    required this.price, required this.description,
    required this.created_at, required this.updated_at, required this.category_name});


  Menu.fromJson(dynamic json){
    id = json['id'] ?? '';
    cat_id = json['category_id'] ?? '';
    name = json['name'] ?? '';
    image = json['image'] ?? '';
    price = json['price'] ?? '';
    description = json['description'] ?? '';
    created_at = json['created_at'] ?? '';
    updated_at = json['updated_at'] ?? '';
    category_name = json['cat_name'] ?? '';
  }
}
