import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:save_key/app/modules/member/account/controllers/account_controller.dart';

import '../../../../../common/app_color/app_colors.dart';
import '../../../../../common/app_images/app_images.dart';
import '../../../../../common/app_text_style/styles.dart';
import '../../../../../common/size_box/custom_sizebox.dart';
import '../../../../../common/widgets/custom_button.dart';
import '../../../../../common/widgets/custom_textfield.dart';

class EditProfileView extends GetView {
  const EditProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    final AccountController controller = Get.find();

    return Scaffold(
      backgroundColor: AppColors.mainColor,
      appBar: AppBar(
        scrolledUnderElevation: 0,
        backgroundColor: AppColors.mainColor,
        leading: Padding(
          padding: const EdgeInsets.only(left: 12).r,
          child: GestureDetector(
            onTap: () => Get.back(),
            child: Image.asset(AppImages.back, scale: 4),
          ),
        ),
        title: Text('Edit Profile', style: appBarStyle),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20).r,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            sh20,
            Center(
              child: Obx(() {
                return Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          border: Border.all(
                            color: AppColors.greenNormal,
                            width: 2,
                          )),
                      child: CircleAvatar(
                        radius: 50,
                        backgroundColor: AppColors.white,
                        child: ClipOval(
                          child: controller.selectedImage.value != null
                              ? Image.file(
                                  controller.selectedImage.value!,
                                  height: Get.height.h,
                                  width: Get.width.w,
                                  fit: BoxFit.cover,
                                )
                              : CachedNetworkImage(
                                  imageUrl: AppImages.profileImage,
                                  height: Get.height.h,
                                  width: Get.width.w,
                                  fit: BoxFit.cover,
                                  placeholder: (context, url) => const Center(
                                    child: CircularProgressIndicator(
                                      color: AppColors.greenLight,
                                    ),
                                  ),
                                  errorWidget: (context, url, error) =>
                                      const Icon(Icons.error,
                                          color: Colors.red),
                                ),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: GestureDetector(
                        onTap: () => controller.pickImageFromGallery(),
                        child: Image.asset(
                          AppImages.editCircle,
                          scale: 4,
                        ),
                      ),
                    ),
                  ],
                );
              }),
            ),
            sh40,
            Text('User Name', style: h5),
            sh8,
            CustomTextField(hintText: 'Enter your name'),
            sh12,
            Text('Email', style: h5),
            sh8,
            CustomTextField(hintText: 'Enter your email'),
            sh12,
            Text('Phone Number', style: h5),
            sh8,
            CustomTextField(hintText: 'Enter your number'),
            sh20,
            CustomButton(
              text: 'Update',
              onPressed: () {
                controller.saveProfileChanges(); // save image to controller
                Get.back();
              },
              gradientColors: AppColors.buttonColor,
            ),
            sh20,
          ],
        ),
      ),
    );
  }
}
