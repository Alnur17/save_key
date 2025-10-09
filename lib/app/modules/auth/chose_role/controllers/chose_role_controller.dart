import 'package:get/get.dart';

class ChoseRoleController extends GetxController {
  var selectedIndex = 0.obs; // Default to 0 (Member selected)

  void selectRole(int index) {
    selectedIndex.value = index;
  }
}
