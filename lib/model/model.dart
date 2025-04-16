class Product {
  final String usersname;
  final String email;
  final String phone_number;
  final String address;
  final String profile_picture;
  final String is_verified;
  final String created_at;

  Product(
      {required this.usersname,
      required this.email,
      required this.phone_number,
      required this.address,
      required this.profile_picture,
      required this.is_verified,
      required this.created_at});

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
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
