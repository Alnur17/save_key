import 'package:get/get.dart';

class SetupYourBusinessController extends GetxController {
  var selectedBusinessType = ''.obs;
  var selectedDiscountType = ''.obs;

  final categories = [
    'All',
    'Furniture',
    'Clothing',
    'Electronics',
    'Food',
    'Others',
  ];

  // default selected
  var selectedCategory = 'Clothing'.obs;

  void changeBusinessType(String? value) {
    if (value != null) {
      selectedBusinessType.value = value;
    }
  }

  void changeDiscountType(String? value) {
    if (value != null) {
      selectedDiscountType.value = value;
    }
  }

  void selectCategory(String category) {
    selectedCategory.value = category;
  }

}
