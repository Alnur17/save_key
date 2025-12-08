import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:save_key/app/modules/member/home/views/qr_code_view.dart';
import 'package:save_key/common/helper/contact_info_card.dart';

import '../../../../../common/app_color/app_colors.dart';
import '../../../../../common/app_images/app_images.dart';
import '../../../../../common/app_text_style/styles.dart';
import '../../../../../common/size_box/custom_sizebox.dart';
import '../../../../../common/widgets/custom_button.dart';
import '../../../../../common/widgets/details_widget.dart';

class DiscountDetailsView extends GetView {
  const DiscountDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        scrolledUnderElevation: 0,
        title: Text(
          'Discount Details',
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
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12).r,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    height: 170.h,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: AppColors.silver,
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: CachedNetworkImage(
                        imageUrl: AppImages.foodImage,
                        scale: 4,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 12,
                    right: 12,
                    child: GestureDetector(
                      onTap: (){},
                      child: Container(
                        height: 35.h,
                        width: 35.w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(40),
                          color: AppColors.black100,
                        ),
                        child: Image.asset(
                          AppImages.favoriteOutline,
                          scale: 4,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20).r,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                              border: Border.all(
                                color: AppColors.greenLight,
                                width: 3,
                              ),
                              borderRadius: BorderRadius.circular(100)),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(100),
                            child: CachedNetworkImage(
                                imageUrl: AppImages.profileImageTwo),
                          ),
                        ),
                        sw8,
                        Expanded(
                          child: Text(
                            'Daily Daawat-Gulshan 1',
                            style: h3,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        sw8,
                        Image.asset(
                          AppImages.location,
                          scale: 4,
                        ),
                        sw5,
                        Text(
                          'View',
                          style: h5.copyWith(
                            color: AppColors.green,
                            decoration: TextDecoration.underline,
                            decorationColor: AppColors.greenNormal,
                            decorationThickness: 2,
                          ),
                        ),
                      ],
                    ),
                    sh8,
                    Text(
                      'A veggie burger is a plant-based patty served in a burger bun, made from ingredients like vegetables legumes in beans.',
                      style: h5,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                    sh20,
                    Text(
                      'Vegetable Burger',
                      style: h3,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    sh12,
                    Text(
                      'A veggie burger is a plant-based patty served in a burger bun, made from ingredients like vegetables legumes in beans.',
                      style: h5,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                    sh16,
                    Text(
                      'Discount Information',
                      style: h3,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                    sh12,
                    DetailsWidget(
                      iconAsset: AppImages.discount,
                      label: 'Discount',
                      time: '20%',
                    ),
                    Divider(),
                    DetailsWidget(
                      iconAsset: AppImages.location,
                      label: 'Location',
                      time: 'Mohakhali, gulsan 01',
                    ),
                    Divider(),
                    DetailsWidget(
                      iconAsset: AppImages.discount,
                      label: 'Can be used',
                      time: '2/5 times',
                    ),
                    Divider(),
                    DetailsWidget(
                      iconAsset: AppImages.instagram,
                      label: 'Instagram',
                      time: 'instagram.com/sultan',
                    ),
                    Divider(),
                    sh16,
                    Text(
                      'Contact Information',
                      style: h3,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                    sh12,
                    ContactInfoCard(
                      icon: AppImages.callCircle,
                      text: '+1 (555) 123-4567',
                      onTap: () {
                        print("Call clicked");
                      },
                    ),
                    sh12,
                    ContactInfoCard(
                      icon: AppImages.mailCircle,
                      text: 'sultanmdalnur@gmail.com',
                      onTap: () {},
                    ),
                    sh20,
                    CustomButton(
                      text: 'Use Discount',
                      onPressed: () {},
                      gradientColors: AppColors.buttonColor,
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
