import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import '../../../../../common/app_color/app_colors.dart';
import '../../../../../common/app_images/app_images.dart';
import '../../../../../common/app_text_style/styles.dart';
import '../../../../../common/size_box/custom_sizebox.dart';
import '../../../../../common/widgets/custom_button.dart';

class VerificationMembershipView extends GetView {
  const VerificationMembershipView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        scrolledUnderElevation: 0,
        title: Text(
          'Verification',
          style: appBarStyle,
        ),
        leading: GestureDetector(
            onTap: () {
              Get.back();
            },
            child: Image.asset(
              AppImages.back,
              scale: 4,
            )),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20).r,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              AppImages.success,
              scale: 4,
            ),
            sh20,
            Text(
              'Congratulations!',
              style: h2.copyWith(color: AppColors.purple),
            ),
            sh5,
            Text(
              'You\'ve successfully verified your membership and unlocked this exclusive discount!',
              style: h5,
              textAlign: TextAlign.center,
            ),
            sh20,
            Text(
              'Enjoy your discount and keep saving with LumeFitness Premium ✨',
              style: h5,
              textAlign: TextAlign.center,
            ),
            sh20,
            CustomButton(
              text: 'Redeemed',
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => const SuccessRedeemDialog(),
                );
              },
              gradientColors: AppColors.buttonColor,
            ),
          ],
        ),
      ),
    );
  }
}

class SuccessRedeemDialog extends StatelessWidget {
  const SuccessRedeemDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: Container(
        padding: const EdgeInsets.all(32),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(24),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 20,
              offset: const Offset(0, 10),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Close button (top right)
            Align(
              alignment: Alignment.topRight,
              child: IconButton(
                icon: const Icon(Icons.close, color: Colors.grey),
                onPressed: () => Navigator.of(context).pop(),
              ),
            ),
            const SizedBox(height: 16),

            // Success Checkmark Circle
            Image.asset(
              AppImages.checkMarkBig,
              scale: 4,
            ),
            const SizedBox(height: 32),

            // Title
            const Text(
              "Redeemed Successfully",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 12),

            // Subtitle
            const Text(
              "Enjoy your discount!",
              style: TextStyle(
                fontSize: 16,
                color: Colors.black54,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
