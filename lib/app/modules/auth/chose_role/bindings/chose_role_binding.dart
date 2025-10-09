import 'package:get/get.dart';

import '../controllers/chose_role_controller.dart';

class ChoseRoleBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ChoseRoleController>(
      () => ChoseRoleController(),
    );
  }
}
