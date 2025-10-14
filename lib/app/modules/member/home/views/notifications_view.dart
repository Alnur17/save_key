import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:save_key/app/modules/auth/auth_landing/views/auth_landing_view.dart';
import 'package:save_key/common/app_color/app_colors.dart';

import '../../../../../common/app_images/app_images.dart';
import '../../../../../common/app_text_style/styles.dart';
import '../../../../../common/size_box/custom_sizebox.dart';
import '../controllers/notifications_controller.dart';

class NotificationsView extends StatelessWidget {
  NotificationsView({super.key});

  final NotificationsController notificationController =
      Get.put(NotificationsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        scrolledUnderElevation: 0,
        title: Text(
          'Notifications',
          style: appBarStyle,
        ),
        leading: GestureDetector(
            onTap: () {
              Get.back();
            },
            child: Image.asset(
              AppImages.back,
              scale: 4,
            )),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20).r,
        child: Column(
          children: [
            sh16,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'TODAY',
                  style: h3,
                ),
                Text(
                  'Mark all as read',
                  style: h5.copyWith(color: AppColors.greenNormal),
                ),
              ],
            ),
            sh12,
            Obx(() {
              return Expanded(
                child: ListView.builder(
                  itemCount: notificationController.notifications.length,
                  itemBuilder: (context, index) {
                    final notification =
                        notificationController.notifications[index];

                    return Dismissible(
                      key: Key(notification['title']!),
                      direction: DismissDirection.endToStart,
                      onDismissed: (direction) {
                        // Calling delete function
                        notificationController.deleteNotification(index);

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
                        color: AppColors.notificationBag,
                        child: ListTile(
                          leading: Container(
                              padding: EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  color: AppColors.white),
                              child: Image.asset(
                                AppImages.calender,
                                scale: 4,
                              )),
                          title: Text(notification['title']!,style: h3,),
                          subtitle: Text(notification['description']!),
                          trailing: Text('1h',style: h5.copyWith(color: AppColors.greenNormal),),
                        ),
                      ),
                    );
                  },
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}
