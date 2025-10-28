import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:save_key/app/modules/auth/chose_role/views/chose_role_view.dart';

import '../../../../../common/app_images/app_images.dart';
import '../../../../../common/widgets/custom_background_color.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      //Get.offAll(()=> OnboardingView());
      //Get.offAll(()=> LocalOnboardingView());
      Get.offAll(()=> ChoseRoleView());
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomBackgroundColor(
        child: Image.asset(
          AppImages.splashLogo,
          scale: 4,
        ),
      ),
    );
  }
}
