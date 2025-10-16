import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:save_key/common/app_color/app_colors.dart';
import 'package:save_key/common/app_images/app_images.dart';
import 'package:save_key/common/size_box/custom_sizebox.dart';
import 'package:save_key/common/widgets/custom_button.dart';
import 'package:save_key/common/widgets/details_widget.dart';

import '../../../../../common/app_text_style/styles.dart';
import '../../../../../common/helper/apply_code_dialog.dart';

class QrCodeView extends StatelessWidget {
  final String data;
  final String label;

  const QrCodeView({
    super.key,
    required this.data,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        scrolledUnderElevation: 0,
        title: Text('Qr Code', style: appBarStyle),
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20).r,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: QrImageView(
                  data: data,
                  version: QrVersions.auto,
                  size: 180, // similar to your example size
                  //backgroundColor: Colors.white,
                ),
              ),
              sh8,
              Text(
                label,
                style: h4,
              ),
              sh30,
              Text(
                'This QR code Valid for only 10 minutes',
                style: h4,
              ),
              sh8,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      'Expiration will be: 10:00',
                      style: h3.copyWith(fontSize: 20.sp),
                    ),
                  ),
                  sw8,
                  CustomButton(
                    width: 120.w,
                    height: 38,
                    text: 'Apply Code',
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) => const ApplyCodeDialog(),
                      );
                    },
                    gradientColors: AppColors.buttonColor,
                  ),
                ],
              ),
              sh30,
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
                        imageUrl: AppImages.profileImageTwo,
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
              Row(
                children: [
                  Container(
                    height: 50,
                    width: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      color: AppColors.silver,
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(6),
                      child: CachedNetworkImage(
                        imageUrl: AppImages.foodImage,
                        scale: 4,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  sw8,
                  Expanded(
                    child: Text(
                      'Vegetable Burger',
                      style: h3,
                    ),
                  ),
                ],
              ),
              sh20,
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
                  Image.asset(AppImages.status,scale: 4,),
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
      ),
    );
  }
}
