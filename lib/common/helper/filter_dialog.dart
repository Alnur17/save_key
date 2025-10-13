import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../app_color/app_colors.dart';
import '../app_text_style/styles.dart';
import '../widgets/custom_textfield.dart';
import '../widgets/custom_button.dart';
import '../size_box/custom_sizebox.dart';

class FilterDialog extends StatelessWidget {
  const FilterDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: AppColors.white,
      insetPadding: EdgeInsets.symmetric(horizontal: 0).r,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20).r,
      ),
      child: Padding(
        padding: EdgeInsets.all(20.w),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Category', style: h3),
                      sh8,
                      CustomTextField(
                        hintText: 'Select',
                      ),
                    ],
                  ),
                ),
                sw12,
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Location', style: h3),
                      sh8,
                      CustomTextField(
                        hintText: 'Select Category',
                      ),
                    ],
                  ),
                ),
              ],
            ),
            sh12,
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Date', style: h3),
                      sh8,
                      CustomTextField(
                        hintText: 'Enter Date',
                      ),
                    ],
                  ),
                ),
                sw12,
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Expiring soon', style: h3),
                      sh8,
                      CustomTextField(
                        hintText: 'Enter Time',
                      ),
                    ],
                  ),
                ),
              ],
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
                    text: 'Search by Filter',
                    onPressed: () {
                      Navigator.pop(context);
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
    );
  }
}
