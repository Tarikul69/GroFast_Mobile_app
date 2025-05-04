class Shop_list {
  final String usersname;
  final String email;
  final String phone_number;
  final String address;
  final String profile_picture;
  final String is_verified;
  final String created_at;

  Shop_list(
      {required this.usersname,
      required this.email,
      required this.phone_number,
      required this.address,
      required this.profile_picture,
      required this.is_verified,
      required this.created_at});

  factory Shop_list.fromJson(Map<String, dynamic> json) {
    return Shop_list(
      usersname: json['usersname'],
      email: json['email'],
      phone_number: json['phone_number'],
      address: json['address'],
      profile_picture: json['profile_picture'],
      is_verified: json['is_verified'],
      created_at: json['created_at'],
    );
  }
}

// models/user_arguments.dart
class ShopArguments {
  final String shop_phone_number;
  final String shop_name;

  ShopArguments(
    this.shop_phone_number,
    this.shop_name,
  );
}
