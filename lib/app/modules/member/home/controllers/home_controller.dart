import 'package:get/get.dart';

class HomeController extends GetxController {
  final categories = ["Featured", "New", "Near by me"];

  // selected category
  var selectedCategory = "Featured".obs;


  void selectCategory(String category) {
    selectedCategory.value = category;
  }

}
