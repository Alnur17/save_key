import 'package:get/get.dart';

import '../controllers/setup_your_business_controller.dart';

class SetupYourBusinessBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SetupYourBusinessController>(
      () => SetupYourBusinessController(),
    );
  }
}
