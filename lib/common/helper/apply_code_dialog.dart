import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:save_key/app/modules/member/home/views/code_deal_view.dart';

import '../app_color/app_colors.dart';
import '../app_text_style/styles.dart';
import '../size_box/custom_sizebox.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_textfield.dart';

class ApplyCodeDialog extends StatelessWidget {
  const ApplyCodeDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: AppColors.white,
      insetPadding: EdgeInsets.symmetric(horizontal: 0).r,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12).r,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12).r,
            width: double.infinity,
            decoration: BoxDecoration(
              color: AppColors.greenLight,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12),
                topRight: Radius.circular(12),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Apply Code',style: h3.copyWith(fontSize: 20.sp)),
                Text('The code partner will provide you privately.',style: h5),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 20).r,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Enter Code', style: h3),
                sh8,
                CustomTextField(
                  hintText: 'Enter Code',
                ),
                sh20,
                Row(
                  children: [
                    Expanded(
                      child: CustomButton(
                        text: 'Cancel',
                        onPressed: () => Navigator.pop(context),
                        backgroundColor: AppColors.greenLight.withOpacity(0.5),
                        textColor: AppColors.greenNormal,
                      ),
                    ),
                    sw12,
                    Expanded(
                      child: CustomButton(
                        text: 'Apply Code',
                        onPressed: () {
                          Navigator.pop(context);
                          Get.to(()=> CodeDealView());
                        },
                        gradientColors: AppColors.buttonColor,
                        textStyle: h5.copyWith(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
