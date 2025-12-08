import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:save_key/common/app_color/app_colors.dart';
import 'package:save_key/common/app_images/app_images.dart';
import 'package:save_key/common/app_text_style/styles.dart';
import '../../../../../common/size_box/custom_sizebox.dart';
import '../controllers/savings_controller.dart';
import '../model/persional_stat_card.dart';

class AnalyticsView extends GetView<SavingsController> {
  const AnalyticsView({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: AppColors.white,
        appBar: AppBar(
          backgroundColor: AppColors.white,
          scrolledUnderElevation: 0,
          title: Text('Personal Analytics', style: appBarStyle),
          titleSpacing: 20.w,
        ),

        body: Column(
          children: [
            sh20,

            /// ----------------- TOP STATS -----------------
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Row(
                children: [
                  Expanded(
                    child: PersonalStatCard(
                      title: 'Top Business',
                      amount: '245',
                      iconPath: AppImages.topBusiness,
                      height: 120.h,
                    ),
                  ),
                  sw12,
                  Expanded(
                    child: PersonalStatCard(
                      title: 'Top Redemption',
                      amount: '35',
                      iconPath: AppImages.dealRedeem,
                      height: 120.h,
                    ),
                  ),
                ],
              ),
            ),

            sh16,

            /// ----------------- TABS -----------------
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: TabBar(
                labelColor: AppColors.greenNormal,
                unselectedLabelColor: AppColors.black,
                indicatorColor: AppColors.green,
                indicatorWeight: 3,
                indicatorSize: TabBarIndicatorSize.tab,
                labelStyle: h3.copyWith(fontWeight: FontWeight.w600),
                tabs: const [
                  Tab(text: "Top Business"),
                  Tab(text: "Top Redemption"),
                ],
              ),
            ),

            /// ----------------- TAB CONTENT -----------------
            Expanded(
              child: TabBarView(
                children: [
                  /// TOP BUSINESS LIST
                  _listSection(
                    isBusiness: true,
                  ),
                  /// TOP REDEMPTION LIST
                  _listSection(
                    isBusiness: false,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// ---------------------------------------------------
  /// REUSABLE LIST SECTION (FOR BOTH TABS)
  /// ---------------------------------------------------
  Widget _listSection({required bool isBusiness}) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
      child: ListView.separated(
        itemCount: 6,
        separatorBuilder: (_, __) => sh12,
        itemBuilder: (context, index) {
          return _businessCard(
            isBusiness
                ? "Daily Daawat–Gulshan 1"
                : "Chicken Burger",
            isBusiness
                ? AppImages.storeImageTwo
                : AppImages.foodImage, // from your screenshot
          );
        },
      ),
    );
  }

  /// ---------------------------------------------------
  /// BUSINESS / REDEMPTION CARD
  /// ---------------------------------------------------
  Widget _businessCard(String title, String image) {
    return Container(
      padding: EdgeInsets.all(12.r),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12).r,
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8).r,
            child: Image.network(
              image,
              width: 55.w,
              height: 55.w,
              fit: BoxFit.cover,
            ),
          ),

          sw12,

          /// TITLE + LOCATION
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: h3),

                sh5,

                Row(
                  children: [
                    Image.asset(AppImages.location,scale: 4,color: AppColors.black,),
                    sw5,
                    Text("Location", style: h5),
                  ],
                )
              ],
            ),
          ),

          /// SALES SECTION
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text("Total sales",
                  style: h5.copyWith(color: AppColors.grey)),
              Text(
                "2375",
                style: h3.copyWith(fontWeight: FontWeight.bold),
              ),
            ],
          )
        ],
      ),
    );
  }
}
