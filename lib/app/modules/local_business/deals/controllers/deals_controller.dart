import 'package:get/get.dart';

class DealsController extends GetxController {
  var selectedDiscountType = ''.obs;
  var selectedEligibility = ''.obs;
  var selectedSchedule = ''.obs;

  var showPercentageField = false.obs;
  var showPromoWindowField = false.obs;
  var showHappyHourField = false.obs;

  void changeDiscountType(String? value) {
    if (value != null) {
      selectedDiscountType.value = value;
      showPercentageField.value = value == 'Percentage';
    }
  }

  void changeEligibility(String? value) {
    if (value != null) {
      selectedEligibility.value = value;
      showPromoWindowField.value = value == 'Promo Window';
      showHappyHourField.value = value == 'Happy Hours';
    }
  }

  void changeSchedule(String? value) {
    if (value != null) {
      selectedSchedule.value = value;
    }
  }
}
