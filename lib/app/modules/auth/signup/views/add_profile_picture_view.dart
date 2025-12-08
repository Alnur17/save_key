import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:save_key/app/modules/auth/chose_role/controllers/chose_role_controller.dart';
import 'package:save_key/app/modules/local_business/setup_your_business/views/setup_your_business_view.dart';
import 'package:save_key/app/modules/member/dashboard/views/dashboard_view.dart';
import 'package:save_key/common/app_color/app_colors.dart';
import 'package:save_key/common/app_images/app_images.dart';
import 'package:save_key/common/app_text_style/styles.dart';
import 'package:save_key/common/size_box/custom_sizebox.dart';
import 'package:save_key/common/widgets/custom_button.dart';
import '../../../../../common/helper/custom_profile_image.dart';
import '../controllers/signup_controller.dart';

class AddProfilePictureView extends StatefulWidget {

  const AddProfilePictureView({super.key});

  @override
  State<AddProfilePictureView> createState() => _AddProfilePictureViewState();
}

class _AddProfilePictureViewState extends State<AddProfilePictureView> {
  final SignupController signupController = Get.put(SignupController());
  final ChoseRoleController choseRoleController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        scrolledUnderElevation: 0,
        title: Text('Add Profile Picture', style: appBarStyle),
        titleSpacing: 20,
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20).r,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Everyone will be able to see your picture.',
                style: h4,
              ),
            ),
            sh20,

            /// --- Profile Image Preview ---
            Obx(() {
              final imageFile = signupController.selectedImage.value;
              return CustomProfileImage(
                imageUrl: imageFile != null
                    ? imageFile.path
                    : AppImages.profileImageTwo, // fallback image
                isFileImage: imageFile != null,
              );
            }),

            const Spacer(),

            /// --- Reactive Buttons ---
            Obx(() {
              final hasSelectedImage = signupController.selectedImage.value != null;

              if (hasSelectedImage) {
                return Column(
                  children: [
                    CustomButton(
                      text: 'Done',
                      onPressed: () {
                        if (choseRoleController.selectedIndex.value == 0) {
                          Get.to(() => DashboardView());
                        } else {
                          Get.to(() => SetupYourBusinessView());
                        }
                      },
                      gradientColors: AppColors.buttonColor,
                    ),
                    sh16,
                    CustomButton(
                      text: 'Change Picture',
                      onPressed: signupController.showImagePickerBottomSheet,
                      backgroundColor: AppColors.transparent,
                      borderColor: AppColors.greenNormal,
                      textColor: AppColors.greenNormal,
                    ),
                  ],
                );
              } else {
                return Column(
                  children: [
                    CustomButton(
                      text: 'Add Picture',
                      onPressed: signupController.showImagePickerBottomSheet,
                      gradientColors: AppColors.buttonColor,
                    ),
                    sh16,
                    CustomButton(
                      text: 'Skip',
                      onPressed: () {
                        if (choseRoleController.selectedIndex.value == 0) {
                          Get.to(() => DashboardView());
                        } else {
                          Get.to(() => SetupYourBusinessView());
                        }
                      },
                      backgroundColor: AppColors.transparent,
                      borderColor: AppColors.greenNormal,
                      textColor: AppColors.greenNormal,
                    ),
                  ],
                );
              }
            }),
            sh60,
          ],
        ),
      ),
    );
  }
}
