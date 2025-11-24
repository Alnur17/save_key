import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:save_key/app/modules/member/home/views/discount_details_view.dart';
import 'package:save_key/app/modules/member/home/views/my_search_view.dart';
import 'package:save_key/app/modules/member/home/views/notifications_view.dart';
import 'package:save_key/app/modules/member/home/views/qr_code_view.dart';
import 'package:save_key/app/modules/member/home/views/verification_membership_view.dart';
import 'package:save_key/common/size_box/custom_sizebox.dart';
import 'package:save_key/common/widgets/custom_textfield.dart';

import '../../../../../common/app_color/app_colors.dart';
import '../../../../../common/app_images/app_images.dart';
import '../../../../../common/app_text_style/styles.dart';
import '../../../../../common/helper/custom_filter_chip.dart';
import '../../../../../common/helper/custom_profile_image.dart';
import '../../../../../common/helper/deal_card.dart';
import '../../../../../common/helper/discount_card.dart';
import '../../../../../common/helper/filter_dialog.dart';
import '../controllers/home_controller.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final HomeController homeController = Get.put(HomeController());

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
                        style: h3.copyWith(
                          color: AppColors.greenNormal,
                        ),
                      ),
                    ],
                  ),
                ),
                sh5,
                Text(
                  'MohaKhali, Dhaka',
                  style: h5,
                ),
              ],
            ),
            Spacer(),
            GestureDetector(
              onTap: () {
                Get.to(() => MySearchView());
              },
              child: Image.asset(
                AppImages.searchCircle,
                scale: 4,
              ),
            ),
            sw8,
            GestureDetector(
              onTap: () {
                Get.to(() => NotificationsView());
                // showDialog(
                //   context: context,
                //   builder: (context) => const FilterDialog(),
                // );
              },
              child: Image.asset(
                AppImages.notificationCircle,
                scale: 4,
              ),
            )
          ],
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, bottom: 12).r,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: AppColors.greenLight,
                border: Border.all(
                  color: AppColors.greenNormal,
                ),
              ),
              child: Row(
                children: [
                  Image.asset(
                    AppImages.checkMark,
                    scale: 4,
                  ),
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
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20).r,
            child: Text(
              'Available Discounts',
              style: h3,
            ),
          ),
          sh12,

          // SizedBox(
          //   height: 35.h,
          //   child: ListView.builder(
          //     scrollDirection: Axis.horizontal,
          //     padding: EdgeInsets.symmetric(horizontal: 20.w),
          //     itemCount: homeController.categories.length,
          //     itemBuilder: (context, index) {
          //       final category = homeController.categories[index];
          //       return Obx(() => CustomFilterChip(
          //             text: category,
          //             isSelected:
          //                 homeController.selectedCategory.value == category,
          //             onTap: () => homeController.selectCategory(category),
          //           ));
          //     },
          //   ),
          // ),
          // sh20,
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.symmetric(horizontal: 20).r,
              itemCount: 5,
              itemBuilder: (context, index) => Padding(
                padding: EdgeInsets.only(
                  bottom: index == 5 - 1 ? 20 : 8,
                ),
                child: DiscountCard(
                  image: "https://picsum.photos/200",
                  title: "Cappuccino Coffee",
                  offer: "20% off on all time",
                  usage: "2/5",
                  infoTitle: "Location",
                  infoValue: "Mohakhali, Dhaka",
                  isBookmarked: false,
                  onButtonTap: () {
                    Get.to(VerificationMembershipView());
                  },
                  onCardTap: () {
                    Get.to(DiscountDetailsView());
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
