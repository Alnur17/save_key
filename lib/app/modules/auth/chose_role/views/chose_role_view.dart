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

  final ChoseRoleController choseRoleController = Get.put(
    ChoseRoleController(),
    permanent: true,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                AppImages.splashLogo,
                scale: 4,
                height: 110,
                width: 110,
              ),
              sh30,
              Text(
                'Choose your role',
                style: h1,
              ),
              sh5,
              Text(
                'Select how you want to get started',
                style: h3.copyWith(color: AppColors.black100),
              ),
              sh24,
              Obx(() => Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: RoleCard(
                          title: 'Member',
                          imagePath: AppImages.member,
                          isSelected:
                              choseRoleController.selectedIndex.value == 0,
                          onTap: () => choseRoleController.selectRole(0),
                        ),
                      ),
                      sw12,
                      Expanded(
                        child: RoleCard(
                          title: 'Local Business',
                          imagePath: AppImages.business,
                          isSelected:
                              choseRoleController.selectedIndex.value == 1,
                          onTap: () => choseRoleController.selectRole(1),
                        ),
                      ),
                    ],
                  )),
              sh30,
              CustomButton(
                text: 'Next',
                onPressed: () {
                  if (choseRoleController.selectedIndex.value == 0) {
                    Get.to(() => OnboardingView());
                  } else if (choseRoleController.selectedIndex.value == 1) {
                    Get.to(() => LocalOnboardingView());
                  }
                },
                gradientColors: AppColors.buttonColor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
