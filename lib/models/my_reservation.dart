class ReservationData{
  String? name;
  String? email;
  String? phone;
  dynamic? guests;
  String? date;

  ReservationData({
    required this.name,
    required this.email,
    required this.phone,
    required this.guests,
    required this.date
  });

  ReservationData.fromJson(dynamic json){
    name = json['name'] ?? '';
    email = json['email'] ?? '';
    phone = json['phone_number'] ?? '';
    guests = json['guest_number'] ?? '';
    date = json['reservation_date'] ?? '';
  }
}