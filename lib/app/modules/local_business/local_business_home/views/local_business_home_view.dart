import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:save_key/app/data/dummy_data.dart';
import 'package:save_key/app/modules/local_business/local_business_home/views/local_business_search_view.dart';

import '../../../../../common/app_color/app_colors.dart';
import '../../../../../common/app_images/app_images.dart';
import '../../../../../common/app_text_style/styles.dart';
import '../../../../../common/helper/custom_profile_image.dart';
import '../../../../../common/helper/top_deals_card.dart';
import '../../../../../common/helper/yearly_chart.dart';
import '../../../../../common/size_box/custom_sizebox.dart';
import '../../../../../common/widgets/custom_textfield.dart';
import '../../../member/savings/model/persional_stat_card.dart';
import '../../deals/views/create_deals_view.dart';
import '../controllers/local_business_home_controller.dart';

class LocalBusinessHomeView extends GetView<LocalBusinessHomeController> {
  const LocalBusinessHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        scrolledUnderElevation: 0,
        toolbarHeight: 150.h,
        titleSpacing: 20.w,
        title: Column(
          children: [
            Row(
              children: [
                CustomProfileImage(
                  imageUrl: AppImages.profileImageTwo,
                  size: 60,
                ),
                sw8,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(
                      text: TextSpan(
                        style: h3,
                        children: [
                          TextSpan(text: 'Hello! '),
                          TextSpan(
                            text: 'Nur',
                            style: h3.copyWith(
                              color: AppColors.greenNormal,
                            ),
                          ),
                        ],
                      ),
                    ),
                    sh5,
                    Text(
                      'Let\'s Create discounts',
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
            sh16,
            GestureDetector(
              onTap: () {
                Get.to(() => LocalBusinessSearchView());
              },
              child: CustomTextField(
                hintText: 'Looking for...',
                isEditable: false,
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 20,
        ),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: PersonalStatCard(
                    title: 'Today\'s',
                    amount: '12',
                    label: 'Redemptions',
                    iconPath: AppImages.dealRedeem,
                    isPositive: true,
                  ),
                ),
                sw12,
                Expanded(
                  child: PersonalStatCard(
                    title: 'This Month',
                    amount: '248',
                    label: 'Redemptions',
                    iconPath: AppImages.dealRedeem,
                    isPositive: true,
                  ),
                ),
              ],
            ),
            sh16,
            Row(
              children: [
                Expanded(
                  child: PersonalStatCard(
                    title: 'Active Deals',
                    amount: '720',
                    label: 'Live Offer',
                    iconPath: AppImages.totalVisit,
                    isPositive: true,
                  ),
                ),
                sw12,
                Expanded(
                  child: PersonalStatCard(
                    title: 'Total Sales',
                    amount: '\$1,930',
                    label: 'From all deals',
                    iconPath: AppImages.avgSaving,
                    isPositive: true,
                  ),
                ),
              ],
            ),
            sh30,
            YearlyChart(
              showDropdown: true,
              chartHeader: 'Yearly Visit Pattern',
            ),
            sh30,
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 20).r,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20).r,
                color: AppColors.greyLight,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Top Performing Deals',
                    style: h3,
                  ),
                  sh20,
                  ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: DummyData.offers.length,
                    itemBuilder: (context, index) {
                      final offer = DummyData.offers[index];
                      return Padding(
                        padding: EdgeInsets.only(bottom: index == DummyData.offers.length - 1 ? 0 : 8),
                        child: TopDealsCard(
                          title: offer['title'] as String,
                          category: offer['category'] as String,
                          redemptions: offer['redemptions'] as String,
                          sales: offer['sales'] as String,
                          status: offer['status'] as String,
                          isActive: offer['isActive'] as bool,
                        ),
                      );
                    },
                  ),

                  // Container(
                  //   width: double.infinity,
                  //   padding:
                  //       EdgeInsets.symmetric(horizontal: 12, vertical: 16).r,
                  //   decoration: BoxDecoration(
                  //     borderRadius: BorderRadius.circular(12).r,
                  //     color: AppColors.white,
                  //   ),
                  //   child: Column(
                  //     crossAxisAlignment: CrossAxisAlignment.start,
                  //     children: [
                  //       Row(
                  //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //         children: [
                  //           Text(
                  //             '20% Off All Beverages',
                  //             style: h3,
                  //           ),
                  //           Container(
                  //             padding: EdgeInsets.symmetric(
                  //                 horizontal: 8, vertical: 4),
                  //             decoration: BoxDecoration(
                  //               color: AppColors.greenLight,
                  //             ),
                  //             child: Text(
                  //               'Active',
                  //               style:
                  //                   h5.copyWith(color: AppColors.greenNormal),
                  //             ),
                  //           ),
                  //         ],
                  //       ),
                  //       sh5,
                  //       Text('Food & Dining',style: h6,),
                  //       sh8,
                  //       Row(
                  //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //         children: [
                  //           Text(
                  //             '32 Redemptions',
                  //             style: h6,
                  //           ),
                  //           Text(
                  //             '\$285 Sales',
                  //             style: h6,
                  //           ),
                  //
                  //         ],
                  //       ),
                  //     ],
                  //   ),
                  // ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
