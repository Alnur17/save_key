import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:save_key/app/modules/local_business/local_business_account/views/edit_business_info_view.dart';
import 'package:save_key/app/modules/local_business/local_business_account/views/local_business_support_view.dart';
import 'package:save_key/app/modules/local_business/local_business_account/views/my_gallery_images_view.dart';

import '../../../../../common/app_color/app_colors.dart';
import '../../../../../common/app_images/app_images.dart';
import '../../../../../common/size_box/custom_sizebox.dart';
import '../../../../../common/widgets/custom_list_tile.dart';
import '../../../../../common/widgets/custom_popup.dart';
import '../../../auth/login/views/login_view.dart';
import '../../../member/account/views/change_password_view.dart';
import '../../../member/account/views/faq_view.dart';
import '../../../member/account/views/privacy_and_policy_view.dart';
import '../../../member/account/views/terms_and_condition_view.dart';
import '../controllers/local_business_account_controller.dart';

class LocalBusinessAccountView extends StatefulWidget {
  final bool showBackButton;

  const LocalBusinessAccountView({super.key, this.showBackButton = false});

  @override
  State<LocalBusinessAccountView> createState() =>
      _LocalBusinessAccountViewState();
}

class _LocalBusinessAccountViewState extends State<LocalBusinessAccountView> {
  final LocalBusinessAccountController localBusinessAccountController = Get.put(LocalBusinessAccountController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.mainColor,
      appBar: AppBar(
        backgroundColor: AppColors.mainColor,
        scrolledUnderElevation: 0,
        title: const Text('Profile'),
        automaticallyImplyLeading: widget.showBackButton,
        titleSpacing: 20,
        leading: widget.showBackButton
            ? GestureDetector(
                onTap: () {
                  Get.back();
                },
                child: Image.asset(
                  AppImages.back,
                  scale: 4,
                ),
              )
            : null,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            sh20,
            Center(
              child: Obx(() {
                final imagePath = localBusinessAccountController.profileImageUrl.value;
                return Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      border: Border.all(
                        color: AppColors.greenNormal,
                        width: 2,
                      )),
                  child: CircleAvatar(
                    radius: 50,
                    backgroundColor: AppColors.whiteDark,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: imagePath.startsWith("http")
                          ? CachedNetworkImage(
                              imageUrl: imagePath,
                              height: Get.height.h,
                              width: Get.width.w,
                              fit: BoxFit.cover,
                              placeholder: (context, url) => const Center(
                                child: CircularProgressIndicator(
                                  color: AppColors.greenLight,
                                ),
                              ),
                              errorWidget: (context, url, error) => const Icon(
                                Icons.error,
                                color: AppColors.red,
                              ),
                            )
                          : Image.file(
                              File(imagePath),
                              height: Get.height.h,
                              width: Get.width.w,
                              fit: BoxFit.cover,
                            ),
                    ),
                  ),
                );
              }),
            ),
            sh30,
            CustomListTile(
              onTap: () {
                Get.to(() => EditBusinessInfoView());
              },
              leadingImage: AppImages.editBusinessProfile,
              title: 'Edit Business Information',
              trailingImage: AppImages.arrowRight,
            ),
            CustomListTile(
              onTap: () {
                Get.to(() => ChangePasswordView());
              },
              leadingImage: AppImages.changePass,
              title: 'Change  Password ',
              trailingImage: AppImages.arrowRight,
            ),
            CustomListTile(
              onTap: () {
                Get.to(() => MyGalleryImagesView());
              },
              leadingImage: AppImages.photo,
              title: 'Gallery',
              trailingImage: AppImages.arrowRight,
            ),
            CustomListTile(
              onTap: () {
                Get.to(() => LocalBusinessSupportView());
              },
              leadingImage: AppImages.support,
              title: 'Support',
              trailingImage: AppImages.arrowRight,
            ),
            CustomListTile(
              onTap: () {
                Get.to(() => TermsAndConditionView());
              },
              leadingImage: AppImages.terms,
              title: 'Terms and conditions',
              trailingImage: AppImages.arrowRight,
            ),
            CustomListTile(
              onTap: () {
                Get.to(() => PrivacyAndPolicyView());
              },
              leadingImage: AppImages.privacy,
              title: 'Privacy and Policies',
              trailingImage: AppImages.arrowRight,
            ),
            CustomListTile(
              onTap: () {
                Get.to(() => FaqView());
              },
              leadingImage: AppImages.faq,
              title: 'FAQ',
              trailingImage: AppImages.arrowRight,
            ),
            CustomListTile(
              onTap: () {
                CustomPopup.show(
                  context: context,
                  title: "Are you sure you want to log out of your profile?",
                  onConfirm: () {
                    Get.offAll(() => LoginView());
                  },
                );
              },
              leadingImage: AppImages.editProfile,
              title: 'Log Out',
              trailingImage: AppImages.arrowRight,
            ),
            sh40,
          ],
        ),
      ),
    );
  }
}
