import 'package:get/get.dart';

class SetupYourBusinessController extends GetxController {
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

  void selectCategory(String category) {
    selectedCategory.value = category;
  }

  final businessType = [
    'In-Person Discounts',
    'Online Discounts',
  ];

  // default selected
  var selectedBusinessType = 'In-Person Discounts'.obs;

  void selectBusinessType(String type) {
    selectedBusinessType.value = type;
  }
}
