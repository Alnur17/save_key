import 'package:get/get.dart';

import '../controllers/local_business_home_controller.dart';

class LocalBusinessHomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LocalBusinessHomeController>(
      () => LocalBusinessHomeController(),
    );
  }
}
