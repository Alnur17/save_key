import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:save_key/common/app_color/app_colors.dart';
import 'package:save_key/common/app_text_style/styles.dart';
import 'package:save_key/common/helper/upload_widget.dart';
import 'package:save_key/common/size_box/custom_sizebox.dart';
import 'package:save_key/common/widgets/custom_button.dart';
import 'package:save_key/common/widgets/custom_textfield.dart';

import '../../../../../common/app_images/app_images.dart';
import '../../../../../common/widgets/custom_dropdown.dart';
import '../controllers/deals_controller.dart';

class CreateDealsView extends StatelessWidget {
  CreateDealsView({super.key});

  final DealsController controller = Get.put(DealsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        scrolledUnderElevation: 0,
        title: Text(
          'Create New Deals',
          style: appBarStyle,
        ),
        leading: Padding(
          padding: EdgeInsets.only(left: 12).r,
          child: GestureDetector(
            onTap: () {
              Get.back();
            },
            child: Image.asset(
              AppImages.back,
              scale: 4,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Deal Title',
              style: h4,
            ),
            sh8,
            CustomTextField(
              hintText: 'Enter the deal name',
            ),
            sh12,
            Text(
              'Description',
              style: h4,
            ),
            sh8,
            CustomTextField(
              height: 150,
              hintText: 'Details here..',
            ),
            sh12,
            Text(
              'Deal Image',
              style: h4,
            ),
            sh8,
            UploadWidget(
              onTap: () {},
              label: 'Click to upload image',
              imagePath: AppImages.gallery,
            ),
            sh12,
            Text(
              'Price',
              style: h4,
            ),
            sh8,
            CustomTextField(
              hintText: 'Enter price',
            ),
            sh12,
            Text(
              'Discount Type',
              style: h4,
            ),
            sh8,
            Obx(
              () => ReusableDropdown(
                options: ['Percentage', 'Buy 1 Get 1 free', 'Free Item'],
                hintText: 'Select a type',
                selectedValue: controller.selectedDiscountType.value,
                onChanged: (value) => controller.changeDiscountType(value),
              ),
            ),
            sh12,
            Text(
              'Eligibility/Frequency',
              style: h4,
            ),
            sh8,
            Obx(
              () => ReusableDropdown(
                options: ['Once per week', 'One-Time Only', 'Unlimited'],
                hintText: 'Select a type',
                selectedValue: controller.selectedEligibility.value,
                onChanged: (value) => controller.changeEligibility(value),
              ),
            ),
            sh12,
            Text(
              'Schedule',
              style: h4,
            ),
            sh8,
            Obx(
              () => ReusableDropdown(
                options: ['Always-on', 'Happy Hours', 'Promo Window'],
                hintText: 'Select a type',
                selectedValue: controller.selectedSchedule.value,
                onChanged: (value) => controller.changeSchedule(value),
              ),
            ),
            sh12,
            Text(
              'Create Private Code',
              style: h4,
            ),
            sh8,
            CustomTextField(
              hintText: 'D-VG326',
            ),
            sh12,
            Text(
              'QR Code Use Limitation',
              style: h4,
            ),
            sh8,
            CustomTextField(
              hintText: '5 times',
            ),
            sh60,
          ],
        ),
      ),
      bottomSheet: Container(
        color: AppColors.white,
        padding: const EdgeInsets.only(left: 20,right: 20, bottom: 20).r,
        child: CustomButton(
        text: 'Upload',
        onPressed: () {},
        gradientColors: AppColors.buttonColor,
            ),
      ),
    );
  }
}
