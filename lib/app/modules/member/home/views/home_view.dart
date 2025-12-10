import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:save_key/app/modules/member/home/views/discount_details_view.dart';
import 'package:save_key/app/modules/member/home/views/my_search_view.dart';
import 'package:save_key/app/modules/member/home/views/notifications_view.dart';
import 'package:save_key/app/modules/member/home/views/verification_membership_view.dart';
import 'package:save_key/common/helper/custom_profile_image.dart';
import 'package:save_key/common/size_box/custom_sizebox.dart';
import '../../../../../common/app_color/app_colors.dart';
import '../../../../../common/app_images/app_images.dart';
import '../../../../../common/app_text_style/styles.dart';
import '../../../../../common/helper/discount_card.dart';

import '../controllers/home_controller.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> with SingleTickerProviderStateMixin {
  final HomeController homeController = Get.put(HomeController());

  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        scrolledUnderElevation: 0,
        toolbarHeight: 90.h,
        titleSpacing: 20,
        title: Row(
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
                        text: 'Sultan',
                        style: h3.copyWith(color: AppColors.greenNormal),
                      ),
                    ],
                  ),
                ),
                sh5,
                Text('MohaKhali, Dhaka', style: h5),
              ],
            ),
            Spacer(),
            GestureDetector(
              onTap: () => Get.to(() => MySearchView()),
              child: Image.asset(AppImages.searchCircle, scale: 4),
            ),
            sw8,
            GestureDetector(
              onTap: () => Get.to(() => NotificationsView()),
              child: Image.asset(AppImages.notificationCircle, scale: 4),
            )
          ],
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Membership Active Banner
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, bottom: 12).r,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.r),
                color: AppColors.greenLight.withOpacity(0.2),
                border: Border.all(color: AppColors.greenNormal.withOpacity(0.3)),
              ),
              child: Row(
                children: [
                  Image.asset(AppImages.checkMark, scale: 4),
                  sw12,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Membership Active', style: h3),
                      Text('Enjoy exclusive discounts!',
                          style: h5.copyWith(color: AppColors.green)),
                    ],
                  )
                ],
              ),
            ),
          ),

          // Title
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20).r,
            child: Text('Available Discounts', style: h3),
          ),
          sh12,

          // TabBar
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20.w),
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(color: AppColors.grey.withOpacity(0.3), width: 1),
              ),
            ),
            child: TabBar(
              controller: _tabController,
              labelColor: AppColors.greenNormal,
              unselectedLabelColor: AppColors.grey,
              labelStyle: h4.copyWith(fontWeight: FontWeight.w600),
              unselectedLabelStyle: h4,
              indicatorColor: AppColors.greenNormal,
              indicatorWeight: 3,
              tabs: [
                Tab(text: 'In-Person'),
                Tab(text: 'Online'),
              ],
            ),
          ),
          sh16,

          // TabBarView
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                // In-Person Tab
                _buildDiscountList(isOnline: false),
                // Online Tab
                _buildDiscountList(isOnline: true),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDiscountList({required bool isOnline}) {
    return ListView.builder(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      itemCount: 6, // You can change this based on data
      itemBuilder: (context, index) {
        final String infoTitle = isOnline ? "Website" : "Location";
        final String infoValue = isOnline ? "www.example${index + 1}.com" : "Mohakhali, Dhaka";

        return Padding(
          padding: EdgeInsets.only(bottom: index == 5 ? 20.h : 8.h),
          child: DiscountCard(
            image: "https://picsum.photos/seed/$index/300/200",
            title: isOnline ? "Online Deal ${index + 1}" : "Cappuccino Coffee",
            offer: "${15 + index * 5}% off",
            usage: "${index + 1}/5",
            infoTitle: infoTitle,
            infoValue: infoValue,
            isBookmarked: index.isEven,
            onButtonTap: () {
              Get.to(() => VerificationMembershipView());
            },
            onCardTap: () {
              Get.to(() => DiscountDetailsView());
            },
          ),
        );
      },
    );
  }
}