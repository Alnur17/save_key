import 'package:get/get.dart';

import '../controllers/auth_landing_controller.dart';

class AuthLandingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthLandingController>(
      () => AuthLandingController(),
    );
  }
}
