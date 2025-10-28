import 'dart:io';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../../common/app_images/app_images.dart';

class LocalBusinessAccountController extends GetxController {
  final ImagePicker _picker = ImagePicker();

  Rx<File?> selectedImage = Rx<File?>(null);

  RxString profileImageUrl = AppImages.profileImage.obs;

  Future<void> pickImageFromGallery() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      selectedImage.value = File(pickedFile.path);
    }
  }

  void saveProfileChanges() {
    if (selectedImage.value != null) {
      profileImageUrl.value = selectedImage.value!.path;
    }
  }
}
