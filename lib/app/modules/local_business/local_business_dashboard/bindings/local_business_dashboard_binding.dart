import 'package:get/get.dart';

import '../controllers/local_business_dashboard_controller.dart';

class LocalBusinessDashboardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LocalBusinessDashboardController>(
      () => LocalBusinessDashboardController(),
    );
  }
}
