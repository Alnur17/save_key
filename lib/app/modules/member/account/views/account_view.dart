import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:save_key/app/modules/member/account/views/subscription_view.dart';
import 'package:save_key/app/modules/member/account/views/notification_manage_view.dart';
import 'package:save_key/app/modules/member/account/views/privacy_and_policy_view.dart';
import 'package:save_key/app/modules/member/account/views/terms_and_condition_view.dart';
import 'package:save_key/common/app_color/app_colors.dart';
import 'package:save_key/common/app_text_style/styles.dart';

import '../../../../../common/app_images/app_images.dart';
import '../../../../../common/size_box/custom_sizebox.dart';
import '../../../../../common/widgets/custom_button.dart';
import '../../../../../common/widgets/custom_list_tile.dart';
import '../../../../../common/widgets/custom_popup.dart';
import '../../../auth/login/views/login_view.dart';
import '../controllers/account_controller.dart';
import 'change_password_view.dart';
import 'edit_profile_view.dart';
import 'faq_view.dart';

class AccountView extends StatelessWidget {
  final bool showBackButton;

  AccountView({super.key, this.showBackButton = false});

  final AccountController accountController = Get.put(AccountController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.mainColor,
      appBar: AppBar(
        backgroundColor: AppColors.mainColor,
        scrolledUnderElevation: 0,
        title: const Text('Profile'),
        automaticallyImplyLeading: showBackButton,
        titleSpacing: 20,
        leading: showBackButton
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
                final imagePath = accountController.profileImageUrl.value;
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
                              errorWidget: (context, url, error) =>
                                  const Icon(
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
                Get.to(() => EditProfileView());
              },
              leadingImage: AppImages.editProfile,
              title: 'Edit Profile',
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
                Get.to(() => SubscriptionView());
              },
              leadingImage: AppImages.subscription,
              title: 'Subscription',
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
                Get.to(() => NotificationManageView());
              },
              leadingImage: AppImages.notification,
              title: 'Notification Manage',
              trailingImage: AppImages.arrowRight,
            ),
            CustomListTile(
              onTap: () {
                CustomPopup.show(
                  context: context,
                  title: "Are you sure you want to delete your profile?",
                  onConfirm: () {},
                );
              },
              leadingImage: AppImages.delete,
              title: 'Delete Profile',
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
