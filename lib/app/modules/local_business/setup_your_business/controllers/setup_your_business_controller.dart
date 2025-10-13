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
}
