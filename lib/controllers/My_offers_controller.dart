import 'package:get/get.dart';

class My_offers_controller extends GetxController {
  // List to store notifications
  List<Offer> offer_list = [
    Offer(
      title: "Buy 1 Get 1 Free",
      description: "Get one free item on every purchase today!",
      type: "daily",
    ),
    Offer(
      title: "10% Off Today Only",
      description: "Enjoy 10% off on all groceries today!",
      type: "daily",
    ),

    // Weekly Offers
    Offer(
      title: "Weekend Super Sale",
      description: "Up to 50% off this weekend on selected items!",
      type: "weekly",
    ),
    Offer(
      title: "Weekly Fresh Deals",
      description: "Fresh fruits and vegetables at discounted prices all week!",
      type: "weekly",
    ),

    // Payment Offers
  ].obs;
  //Daily Offers
  List<Offer> offers_type(String type) {
    return offer_list.where((offer_list) => offer_list.type == type).toList();
  }

  //Weekly Offers
  void weeklyOffers() {}
  //Payment Offer
  void paymentOffers() {}
}

class Offer {
  final String title;
  final String description;
  final String type; // daily, weekly, payment

  Offer({
    required this.title,
    required this.description,
    required this.type,
  });
}
