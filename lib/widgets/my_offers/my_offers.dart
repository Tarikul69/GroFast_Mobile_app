import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gro_fast/components/card.dart';
import 'package:gro_fast/controllers/my_offers_controller.dart';
import 'package:gro_fast/styles/style.dart';

class my_offers extends StatelessWidget {
  final My_offers_controller offer_controller = Get.put(My_offers_controller());

  my_offers({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text("My Offers"),
      ),
      body: SingleChildScrollView(
        child: Obx(
          () {
            List<Offer> dailyOffers = offer_controller.offers_type('daily');
            List<Offer> weeklyOffers = offer_controller.offers_type('weekly');
            List<Offer> paymentOffers = offer_controller.offers_type('payment');

            Text("Daily Offers");

            if (dailyOffers.isEmpty) {
              return Center(
                child: Text(
                  'No Offer is available for you',
                  style: textStyle(),
                ),
              );
            }
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //Daily Offers
                  const Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Text(
                      "Daily Offers",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                  if (dailyOffers.isEmpty)
                    Center(
                      child: Text(
                        "data",
                        style: textStyle(),
                      ),
                    )
                  else
                    for (var offer in dailyOffers)
                      notificationCard(
                        icon: Icons.offline_bolt,
                        title: offer.title,
                        onTap: () {},
                      ),

                  //Weekly offers
                  const Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Text(
                      "Daily Offers",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                  if (weeklyOffers.isEmpty)
                    Center(
                      child: Text(
                        "No weekly offer is available",
                        style: textStyle(10),
                      ),
                    )
                  else
                    for (var offer in weeklyOffers)
                      notificationCard(
                        icon: Icons.offline_bolt,
                        title: offer.title,
                        onTap: () {},
                      ),

                  //Payment Offers
                  const Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Text(
                      "Payment Offers",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                  if (paymentOffers.isEmpty)
                    Center(
                      child: Text(
                        "No Payment Offers is available",
                        style: textStyle(10),
                      ),
                    )
                  else
                    for (var offer in paymentOffers)
                      notificationCard(
                        icon: Icons.offline_bolt,
                        title: offer.title,
                        onTap: () {},
                      ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
