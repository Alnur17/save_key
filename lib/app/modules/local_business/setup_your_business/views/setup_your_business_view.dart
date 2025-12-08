import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:save_key/app/modules/local_business/setup_your_business/views/request_submitted_view.dart';
import 'package:save_key/common/app_color/app_colors.dart';
import 'package:save_key/common/app_text_style/styles.dart';
import 'package:save_key/common/widgets/custom_button.dart';
import 'package:save_key/common/widgets/custom_textfield.dart';

import '../../../../../common/app_images/app_images.dart';
import '../../../../../common/size_box/custom_sizebox.dart';
import '../../../../../common/widgets/custom_dropdown.dart';
import '../controllers/setup_your_business_controller.dart';

class SetupYourBusinessView extends StatelessWidget {
  SetupYourBusinessView({super.key});

  final controller = Get.put(SetupYourBusinessController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        scrolledUnderElevation: 0,
        title: Text(
          'Setup Your Business',
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
        padding: const EdgeInsets.symmetric(horizontal: 20).r,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              sh16,
              Text('Choose Business Type', style: h3),
              sh8,
              Obx(
                () => Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ReusableDropdown(
                      options: [
                        'In-Person Discounts',
                        'In-Person with Promo Code Discount',
                        'Online Discount'
                      ],
                      hintText: 'Select a type',
                      selectedValue: controller.selectedBusinessType.value,
                      onChanged: (value) =>
                          controller.changeBusinessType(value),
                    ),
                  ],
                ),
              ),
              sh20,
              Text('Discount Type', style: h3),
              sh8,
              Obx(
                () => Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ReusableDropdown(
                      options: [
                        'Weekly',
                        'Monthly',
                        'Unlimited'
                      ],
                      hintText: 'Select Discount type',
                      selectedValue: controller.selectedDiscountType.value,
                      onChanged: (value) =>
                          controller.changeDiscountType(value),
                    ),
                  ],
                ),
              ),
              sh20,
              Text(
                'Business Address',
                style: h3,
              ),
              sh8,
              CustomTextField(
                hintText: 'Enter Your address',
              ),
              sh20,
              Text(
                'Description',
                style: h3,
              ),
              sh8,
              CustomTextField(
                height: 100,
                hintText: 'Write here...',
              ),
              sh20,
              Text('Category', style: h3),
              sh8,
              Obx(
                () => Wrap(
                  spacing: 10,
                  runSpacing: 8,
                  children: controller.categories.map((category) {
                    final isSelected =
                        controller.selectedCategory.value == category;
                    return ChoiceChip(
                      label: Text(
                        category,
                        style: h5.copyWith(
                          color: isSelected ? Colors.white : Colors.black87,
                        ),
                      ),
                      showCheckmark: false,
                      selected: isSelected,
                      onSelected: (_) => controller.selectCategory(category),
                      selectedColor: AppColors.greenNormal,
                      backgroundColor: AppColors.textFieldBag,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                        side: BorderSide.none,
                      ),
                    );
                  }).toList(),
                ),
              ),
              sh20,
              Text(
                'Website',
                style: h3,
              ),
              sh8,
              CustomTextField(
                hintText: 'www.abc.com',
              ),
              sh20,
              Text(
                'Instagram',
                style: h3,
              ),
              sh8,
              CustomTextField(
                hintText: 'www.instagram.com/username',
              ),
              sh20,
              CustomButton(
                text: 'Request',
                onPressed: () {
                  Get.to(() => RequestSubmittedView());
                },
                gradientColors: AppColors.buttonColor,
              ),
              sh60,
            ],
          ),
        ),
      ),
    );
  }
}
