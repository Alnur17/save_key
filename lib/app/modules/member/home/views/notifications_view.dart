import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/notifications_controller.dart';

class NotificationsView extends StatelessWidget {
  NotificationsView({super.key});
  final NotificationsController notificationController =
  Get.put(NotificationsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Notifications')),
      body: Obx(() {
        return ListView.builder(
          itemCount: notificationController.notifications.length,
          itemBuilder: (context, index) {
            final notification = notificationController.notifications[index];

            return Dismissible(
              key: Key(notification['title']!),
              direction: DismissDirection.endToStart,
              onDismissed: (direction) {
                // Call the delete function from the controller
                notificationController.deleteNotification(index);

                // Show a SnackBar as feedback
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Notification deleted')),
                );
              },
              background: Container(
                color: Colors.red,
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Icon(
                    Icons.delete,
                    color: Colors.white,
                  ),
                ),
              ),
              child: Card(
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                child: ListTile(
                  title: Text(notification['title']!),
                  subtitle: Text(notification['description']!),
                ),
              ),
            );
          },
        );
      }),
    );
  }
}
