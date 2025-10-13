import 'package:get/get.dart';

class NotificationsController extends GetxController {
  var notifications = <Map<String, String>>[
    {
      'title': 'New Discount to near you',
      'description':
      'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature.',
    },
    {
      'title': 'Special Offer on Shoes',
      'description':
      'Hurry! Get 50% off on your next purchase. Valid for today only.',
    },
  ].obs;

  // Function to delete a notification
  void deleteNotification(int index) {
    notifications.removeAt(index);
  }
}
