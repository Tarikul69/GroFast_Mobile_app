import 'package:get/get.dart';

class NotificationController extends GetxController {
  // List to store notifications
  var notifications = <String>[].obs;

  // Add a new notification
  void addNotification(String message) {
    notifications.add(message);
  }

  // Remove a notification by index
  void removeNotification(int index) {
    if (index >= 0 && index < notifications.length) {
      notifications.removeAt(index);
    }
  }

  // Clear all notifications
  void clearNotifications() {
    notifications.clear();
  }
}
