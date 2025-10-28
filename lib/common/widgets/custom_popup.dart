import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../../common/app_color/app_colors.dart';
import '../../../../../common/app_text_style/styles.dart';
import '../../../../../common/size_box/custom_sizebox.dart';
import '../../../../../common/widgets/custom_button.dart';

class CustomPopup {
  static void show({
    required BuildContext context,
    required String title,
    required VoidCallback onConfirm,
    String confirmText = "Yes",
    String cancelText = "No",
    Color confirmColor = AppColors.red,
    Color cancelColor = AppColors.silver,
  }) {
    Get.dialog(
      Dialog(
        backgroundColor: AppColors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: Padding(
          padding: EdgeInsets.all(20.w),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                title,
                textAlign: TextAlign.center,
                style: h3.copyWith(fontWeight: FontWeight.w500),
              ),
              sh20,
              Row(
                children: [
                  Expanded(
                    child: CustomButton(
                      text: cancelText,
                      borderRadius: 12,
                      backgroundColor: cancelColor,
                      textColor: AppColors.black,
                      onPressed: () => Get.back(),
                    ),
                  ),
                  sw12,
                  Expanded(
                    child: CustomButton(
                      text: confirmText,
                      borderRadius: 12,
                      backgroundColor: confirmColor,
                      textColor: AppColors.white,
                      onPressed: () {
                        Get.back();
                        onConfirm();
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
