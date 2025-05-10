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
  final int shop_id;
  final String shop_name;

  ShopArguments(
    this.shop_id,
    this.shop_name,
  );
}

//Product Category Model
class Product_Category {
  int? category_id;
  String? category_name;
  String? created_at;
  int? shop_id;

  Product_Category(
      {this.category_id, this.category_name, this.created_at, this.shop_id});
  Product_Category.fromJson(Map<String, dynamic> json) {
    category_id = json['category_id'];
    category_name = json['category_name'];
    created_at = json['created_at'];
    shop_id = json['shop_id'];
  }

  Map<String, dynamic> tojson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['category_id'] = this.category_id;
    data['category_name'] = this.category_name;
    data['created_at'] = this.created_at;
    data['shop_id'] = this.shop_id;

    return data;
  }
}
