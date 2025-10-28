import 'package:get/get.dart';

import 'package:save_key/app/modules/member/home/controllers/notifications_controller.dart';

import '../controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NotificationsController>(
      () => NotificationsController(),
    );
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
  }
}
