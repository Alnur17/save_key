import 'package:get/get.dart';

class DealsController extends GetxController {
  var selectedDiscountType = ''.obs;
  var selectedEligibility = ''.obs;
  var selectedSchedule = ''.obs;

  void changeDiscountType(String? value) {
    if (value != null) {
      selectedDiscountType.value = value;
    }
  }

  void changeEligibility(String? value) {
    if (value != null) {
      selectedEligibility.value = value;
    }
  }

  void changeSchedule(String? value) {
    if (value != null) {
      selectedSchedule.value = value;
    }
  }
}
