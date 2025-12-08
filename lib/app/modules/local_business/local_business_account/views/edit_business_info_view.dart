import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import '../../../../../common/app_color/app_colors.dart';
import '../../../../../common/app_images/app_images.dart';
import '../../../../../common/app_text_style/styles.dart';
import '../../../../../common/size_box/custom_sizebox.dart';
import '../../../../../common/widgets/custom_button.dart';
import '../../../../../common/widgets/custom_dropdown.dart';
import '../../../../../common/widgets/custom_textfield.dart';
import '../../setup_your_business/controllers/setup_your_business_controller.dart';
import '../controllers/local_business_account_controller.dart';

class EditBusinessInfoView extends StatelessWidget {
  EditBusinessInfoView({super.key});

  final controller = Get.put(SetupYourBusinessController());
  final LocalBusinessAccountController localBusinessAccountController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        scrolledUnderElevation: 0,
        backgroundColor: AppColors.white,
        title: Text(
          'Edit Business Info',
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
        padding: EdgeInsets.symmetric(horizontal: 20).r,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            sh20,
            Center(
              child: Obx(() {
                return Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          border: Border.all(
                            color: AppColors.greenNormal,
                            width: 2,
                          )),
                      child: CircleAvatar(
                        radius: 50,
                        backgroundColor: AppColors.white,
                        child: ClipOval(
                          child: localBusinessAccountController
                                      .selectedImage.value !=
                                  null
                              ? Image.file(
                                  localBusinessAccountController
                                      .selectedImage.value!,
                                  height: Get.height.h,
                                  width: Get.width.w,
                                  fit: BoxFit.cover,
                                )
                              : CachedNetworkImage(
                                  imageUrl: AppImages.profileImage,
                                  height: Get.height.h,
                                  width: Get.width.w,
                                  fit: BoxFit.cover,
                                  placeholder: (context, url) => const Center(
                                    child: CircularProgressIndicator(
                                      color: AppColors.greenLight,
                                    ),
                                  ),
                                  errorWidget: (context, url, error) =>
                                      const Icon(Icons.error,
                                          color: Colors.red),
                                ),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: GestureDetector(
                        onTap: () => localBusinessAccountController
                            .pickImageFromGallery(),
                        child: Image.asset(
                          AppImages.editCircle,
                          scale: 4,
                        ),
                      ),
                    ),
                  ],
                );
              }),
            ),
            sh40,
            Text(
              'Business name',
              style: h3,
            ),
            sh8,
            CustomTextField(
              hintText: 'Enter Your name',
            ),
            sh20,
            Text(
              'Email',
              style: h3,
            ),
            sh8,
            CustomTextField(
              hintText: 'Enter Your email',
            ),
            sh20,
            Text(
              'Phone Number',
              style: h3,
            ),
            sh8,
            CustomTextField(
              hintText: 'Enter Your number',
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
                    onChanged: (value) => controller.changeBusinessType(value),
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
                    options: ['Weekly', 'Monthly', 'Unlimited'],
                    hintText: 'Select Discount type',
                    selectedValue: controller.selectedDiscountType.value,
                    onChanged: (value) => controller.changeDiscountType(value),
                  ),
                ],
              ),
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
            CustomButton(
              text: 'Update',
              onPressed: () {
                // Get.to(()=> RequestSubmittedView());
              },
              gradientColors: AppColors.buttonColor,
            ),
            sh20,
          ],
        ),
      ),
    );
  }
}
