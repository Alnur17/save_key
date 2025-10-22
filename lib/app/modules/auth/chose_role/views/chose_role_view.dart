import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:save_key/app/modules/auth/onboarding/views/local_onboading_view.dart';
import 'package:save_key/app/modules/auth/onboarding/views/onboarding_view.dart';
import 'package:save_key/common/app_color/app_colors.dart';
import 'package:save_key/common/app_images/app_images.dart';
import 'package:save_key/common/widgets/custom_button.dart';

import '../../../../../common/app_text_style/styles.dart';
import '../../../../../common/helper/role_card.dart';
import '../../../../../common/size_box/custom_sizebox.dart';
import '../controllers/chose_role_controller.dart';

class ChoseRoleView extends StatelessWidget {
  ChoseRoleView({super.key});

  final ChoseRoleController controller = Get.put(ChoseRoleController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                AppImages.logo,
                scale: 4,
              ),
              sh40,
              Text(
                'Choose your role',
                style: h1,
              ),
              sh5,
              Text(
                'Select how you want to get started',
                style: h3.copyWith(color: AppColors.black100),
              ),
              sh20,
              Obx(() => Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: RoleCard(
                      title: 'Member',
                      subtitle: 'Select how you want to get started',
                      imagePath: AppImages.member,
                      isSelected: controller.selectedIndex.value == 0,
                      onTap: () => controller.selectRole(0),
                    ),
                  ),
                  sw12,
                  Expanded(
                    child: RoleCard(
                      title: 'Local Business',
                      subtitle: 'Select how you want to get started',
                      imagePath: AppImages.business,
                      isSelected: controller.selectedIndex.value == 1,
                      onTap: () => controller.selectRole(1),
                    ),
                  ),
                ],
              )),
              sh20,
              CustomButton(
                text: 'Next',
                onPressed: (){
                  if (controller.selectedIndex.value == 0) {
                    Get.to(() => OnboardingView());
                  } else if (controller.selectedIndex.value == 1) {
                    Get.to(() => LocalOnboardingView());
                  }
                },
                gradientColors: AppColors.buttonColor,
              )
            ],
          ),
        ),
      ),
    );
  }
}