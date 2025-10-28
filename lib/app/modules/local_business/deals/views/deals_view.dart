import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:save_key/app/modules/local_business/deals/views/create_deals_view.dart';
import 'package:save_key/common/app_color/app_colors.dart';
import 'package:save_key/common/app_text_style/styles.dart';

import '../../../../../common/app_images/app_images.dart';
import '../../../../../common/size_box/custom_sizebox.dart';
import '../controllers/deals_controller.dart';

class DealsView extends GetView<DealsController> {
  const DealsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        scrolledUnderElevation: 0,
        titleSpacing: 20.w,
        toolbarHeight: 90.h,
        title: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Deals Management', style: appBarStyle),
                sh5,
                Text(
                  '06 Active deals',
                  style: h5,
                ),
              ],
            ),
            Spacer(),
            GestureDetector(
              onTap: () {
                Get.to(()=> CreateDealsView());
              },
              child: Image.asset(
                AppImages.addCircle,
                scale: 4,
              ),
            ),
          ],
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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20).r,
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(12).r,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12).r,
                color: AppColors.greyLight,
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        height: 120.h,
                        width: 90.w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8).r,
                          color: AppColors.silver,
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8).r,
                          child: CachedNetworkImage(
                            imageUrl: AppImages.foodImage,
                            scale: 4,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      sw8,
                      Expanded(
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Text(
                                    '20% Off All Beverages',
                                    style: h3,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                sw5,
                                Container(
                                  alignment: Alignment.center,
                                  padding: EdgeInsets.symmetric(horizontal: 8),
                                  height: 30.h,
                                  color: AppColors.greenLight,
                                  child: Text(
                                    'Approved',
                                    style: h4.copyWith(
                                        color: AppColors.greenNormal),
                                  ),
                                ),
                              ],
                            ),
                            sh8,
                            Text(
                              'A veggie burger is a plant-based burger bun, made from ingredient',
                              style: h6,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            sh12,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Row(
                                    children: [
                                      Image.asset(
                                        AppImages.deals,
                                        scale: 4,
                                      ),
                                      sw5,
                                      Expanded(
                                          child: Text(
                                        'Food & Dining',
                                        style: h6,
                                      )),
                                    ],
                                  ),
                                ),
                                sw8,
                                Expanded(
                                  child: Row(
                                    children: [
                                      Image.asset(
                                        AppImages.calender,
                                        scale: 4,
                                      ),
                                      sw5,
                                      Expanded(
                                          child: Text(
                                        'Expires 30 sep, 2025',
                                        style: h6,
                                      )),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                        onTap: (){},
                        child: Row(
                          children: [
                            Image.asset(AppImages.edit,scale: 4,),
                            sw8,
                            Text('Edit',style: h5,)
                          ],
                        ),
                      ),
                      sw20,GestureDetector(
                        onTap: (){},
                        child: Row(
                          children: [
                            Image.asset(AppImages.pause,scale: 4,),
                            sw8,
                            Text('Pause',style: h5,)
                          ],
                        ),
                      ),
                      sw20,GestureDetector(
                        onTap: (){},
                        child: Row(
                          children: [
                            Image.asset(AppImages.delete,scale: 4,color: AppColors.red,),
                            sw8,
                            Text('Delete',style: h5.copyWith(color: AppColors.red),)
                          ],
                        ),
                      ),
                      sw20,
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
