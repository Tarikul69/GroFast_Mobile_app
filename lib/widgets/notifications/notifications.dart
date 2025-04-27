import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gro_fast/controllers/NotificationController.dart';

class notifications extends StatelessWidget {
  final NotificationController notificationController =
      Get.put(NotificationController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Notifications')),
      body: Obx(() {
        if (notificationController.notifications.isEmpty) {
          return Center(child: Text('No Notifications'));
        }
        return ListView.builder(
          itemCount: notificationController.notifications.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(notificationController.notifications[index]),
              trailing: IconButton(
                icon: Icon(Icons.close),
                onPressed: () =>
                    notificationController.removeNotification(index),
              ),
            );
          },
        );
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          notificationController
              .addNotification('New notification at ${DateTime.now()}');
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
