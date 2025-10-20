import 'package:get/get.dart';

import '../controllers/local_business_account_controller.dart';

class LocalBusinessAccountBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LocalBusinessAccountController>(
      () => LocalBusinessAccountController(),
    );
  }
}
