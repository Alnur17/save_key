import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

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
                    height: 200,
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
                    top: 0,
                    right: 0,
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 16).r,
                      alignment: Alignment.center,
                      height: 35.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                        ),
                        color: AppColors.greenLight,
                      ),
                      child: Text('Saved \$20', style: h5),
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
                      'All Information',
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
                      iconAsset: AppImages.discount,
                      label: 'Save',
                      time: '\$20',
                    ),
                    Divider(),
                    DetailsWidget(
                      iconAsset: AppImages.location,
                      label: 'Location',
                      time: 'Mohakhali, gulsan 01',
                    ),
                    Divider(),
                    DetailsWidget(
                      iconAsset: AppImages.calender,
                      label: 'Date',
                      time: '23 sep 2025',
                    ),
                    Divider(),
                    DetailsWidget(
                      iconAsset: AppImages.clock,
                      label: 'Start time',
                      time: '06:00 PM',
                    ),
                    Divider(),
                    DetailsWidget(
                      iconAsset: AppImages.clock,
                      label: 'End time',
                      time: '09:00 PM',
                    ),
                    Divider(),
                    DetailsWidget(
                      iconAsset: AppImages.scannerSmall,
                      label: 'Same QR code can use',
                      time: '05 Times',
                    ),
                    Divider(),
                    DetailsWidget(
                      iconAsset: AppImages.website,
                      label: 'Website',
                      time: 'www.dailydaawat.com',
                    ),
                    Divider(),
                    DetailsWidget(
                      iconAsset: AppImages.facebookSmall,
                      label: 'Facebook',
                      time: 'fb/dailydaawat',
                    ),
                    Divider(),
                    DetailsWidget(
                      iconAsset: AppImages.linkedInSmall,
                      label: 'LinkedIn',
                      time: 'ld/dailydaawat',
                    ),
                    sh20,
                    CustomButton(
                      text: 'QR Generate',
                      onPressed: () {},
                      imageAssetPath: AppImages.scannerSmall,
                      centerImageWithText: true,
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
