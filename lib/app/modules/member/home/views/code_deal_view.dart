import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:save_key/app/modules/member/home/views/deal_success_view.dart';
import 'package:save_key/common/app_images/app_images.dart';
import 'package:save_key/common/size_box/custom_sizebox.dart';

import '../../../../../common/app_color/app_colors.dart';
import '../../../../../common/app_text_style/styles.dart';
import '../../../../../common/widgets/details_widget.dart';

class CodeDealView extends GetView {
  const CodeDealView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        scrolledUnderElevation: 0,
        title: Text('Code Deal', style: appBarStyle),
        leading: GestureDetector(
          onTap: () {
            Get.back();
          },
          child: Image.asset(
            AppImages.back,
            scale: 4,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20).r,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            sh20,
            Stack(
              children: [
                Container(
                  height: 220,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: AppColors.silver,
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: CachedNetworkImage(
                      imageUrl: AppImages.foodImage,
                      fit: BoxFit.cover,
                      placeholder: (context, url) => Center(
                        child: CircularProgressIndicator(
                          color: AppColors.greenLight,
                        ),
                      ),
                      errorWidget: (context, url, error) => Icon(Icons.error),
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
                    child: Text(
                      'Saved \$20',
                      style: h5.copyWith(
                        color: AppColors.greenNormal,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            sh30,
            Row(
              children: [
                GestureDetector(
                  onTap: (){
                    Get.offAll(()=> DealSuccessView());
                  },
                  child: Container(
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
                        imageUrl: AppImages.profileImageTwo,
                      ),
                    ),
                  ),
                ),
                sw8,
                Expanded(
                  child: Text(
                    'Daily Daawat-Gulshan 1',
                    style: h3,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
            sh20,
            Text(
              'Vegetable Burger',
              style: h3,
            ),
            sh20,
            DetailsWidget(
              iconAsset: AppImages.code,
              label: 'Code',
              time: 'D-VG326',
            ),
            sh12,
            DetailsWidget(
              iconAsset: AppImages.discount,
              label: 'Discount',
              time: '20%',
            ),
            sh12,
            DetailsWidget(
              iconAsset: AppImages.calender,
              label: 'Date',
              time: '23 sep 2025',
            ),
            sh12,
            DetailsWidget(
              iconAsset: AppImages.use,
              label: 'Used',
              time: '04 Times',
            ),
            sh12,
            Row(
              children: [
                Image.asset(
                  AppImages.status,
                  scale: 4,
                ),
                sw8,
                Expanded(
                  child: Text(
                    'Status',
                    style: h5,
                  ),
                ),
                sw8,
                Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  height: 30.h,
                  color: AppColors.greenLight,
                  child: Text(
                    'Active',
                    style: h4.copyWith(color: AppColors.greenNormal),
                  ),
                ),
              ],
            ),
            sh20,
          ],
        ),
      ),
    );
  }
}
