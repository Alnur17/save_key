import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:save_key/app/modules/member/home/views/my_search_view.dart';
import 'package:save_key/app/modules/member/home/views/notifications_view.dart';
import 'package:save_key/common/size_box/custom_sizebox.dart';
import 'package:save_key/common/widgets/custom_textfield.dart';

import '../../../../../common/app_color/app_colors.dart';
import '../../../../../common/app_images/app_images.dart';
import '../../../../../common/app_text_style/styles.dart';
import '../../../../../common/helper/custom_filter_chip.dart';
import '../../../../../common/helper/deal_card.dart';
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
        toolbarHeight: 150.h,
        titleSpacing: 20,
        title: Column(
          children: [
            Row(
              children: [
                Container(
                  height: 60,
                  width: 60,
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: AppColors.greenLight,
                        width: 3,
                      ),
                      borderRadius: BorderRadius.circular(100)),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child:
                        CachedNetworkImage(imageUrl: AppImages.profileImageTwo),
                  ),
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
                    Get.to(()=> NotificationsView());
                  },
                  child: Image.asset(
                    AppImages.notification,
                    scale: 4,
                  ),
                ),
                sw8,
                GestureDetector(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) => const FilterDialog(),
                    );
                  },
                  child: Image.asset(
                    AppImages.filter,
                    scale: 4,
                  ),
                )
              ],
            ),
            sh16,
            GestureDetector(
              onTap: () {
                Get.to(()=> MySearchView());
              },
              child: CustomTextField(
                hintText: 'Looking for...',
                isEditable: false,
              ),
            ),
          ],
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20).r,
            child: Text(
              'Category',
              style: h3,
            ),
          ),
          sh12,
          SizedBox(
            height: 35.h,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              itemCount: homeController.categories.length,
              itemBuilder: (context, index) {
                final category = homeController.categories[index];
                return Obx(() => CustomFilterChip(
                      text: category,
                      isSelected:
                          homeController.selectedCategory.value == category,
                      onTap: () => homeController.selectCategory(category),
                    ));
              },
            ),
          ),
          sh20,
          Expanded(
            child: ListView.builder(
              itemCount: 5,
              itemBuilder: (context, index) => Padding(
                padding: EdgeInsets.only(
                  bottom: index == 5 - 1 ? 20 : 8,
                ),
                child: DealCard(
                  mainImage: AppImages.foodImage,
                  profileImage: AppImages.profileImageTwo,
                  restaurantName: 'Daily Daawat - Gulshan 1',
                  foodName: 'Vegetable Burger',
                  description:
                      'A veggie burger is a plant-based patty served in a burger bun, made from ingredients like vegetables and legumes.',
                  discount: '20%',
                  date: '23 Sep 2025',
                  startTime: '03:00 PM',
                  dealType: 'New Deal',
                  savedAmount: 'Saved \$20',
                  onDetailsTap: () {},
                  onScannerTap: () {},
                  onBookmarkTap: () {},
                  onViewTap: () {},
                ),
              ),
            ),
          ),
          // Container(
          //   margin: EdgeInsets.symmetric(horizontal: 20).r,
          //   decoration: BoxDecoration(
          //     borderRadius: BorderRadius.circular(20),
          //     color: AppColors.textFieldBag,
          //   ),
          //   child: Column(
          //     children: [
          //       Stack(
          //         children: [
          //           Container(
          //             height: 200,
          //             width: double.infinity,
          //             decoration: BoxDecoration(
          //               borderRadius: BorderRadius.circular(20),
          //               color: AppColors.silver,
          //             ),
          //             child: ClipRRect(
          //               borderRadius: BorderRadius.circular(20),
          //               child: Image.asset(
          //                 AppImages.foodImage,
          //                 scale: 4,
          //                 fit: BoxFit.cover,
          //               ),
          //             ),
          //           ),
          //           Positioned(
          //             top: 0,
          //             right: 0,
          //             child: Container(
          //               padding: EdgeInsets.symmetric(horizontal: 16).r,
          //               alignment: Alignment.center,
          //               height: 35.h,
          //               decoration: BoxDecoration(
          //                 borderRadius: BorderRadius.only(
          //                   bottomLeft: Radius.circular(20),
          //                   topRight: Radius.circular(20),
          //                 ),
          //                 color: AppColors.greenLight,
          //               ),
          //               child: Text('Saved \$20', style: h5),
          //             ),
          //           ),
          //         ],
          //       ),
          //       Padding(
          //         padding: const EdgeInsets.symmetric(
          //           horizontal: 12,
          //           vertical: 20,
          //         ).r,
          //         child: Column(
          //           children: [
          //             Row(
          //               children: [
          //                 Container(
          //                   height: 40,
          //                   width: 40,
          //                   decoration: BoxDecoration(
          //                       border: Border.all(
          //                         color: AppColors.greenLight,
          //                         width: 3,
          //                       ),
          //                       borderRadius: BorderRadius.circular(100)),
          //                   child: ClipRRect(
          //                     borderRadius: BorderRadius.circular(100),
          //                     child: CachedNetworkImage(
          //                         imageUrl: AppImages.profileImageTwo),
          //                   ),
          //                 ),
          //                 sw8,
          //                 Expanded(
          //                   child: Text(
          //                     'Daily Daawat-Gulshan 1',
          //                     style: h3,
          //                     maxLines: 1,
          //                     overflow: TextOverflow.ellipsis,
          //                   ),
          //                 ),
          //                 sw8,
          //                 Image.asset(
          //                   AppImages.location,
          //                   scale: 4,
          //                 ),
          //                 sw5,
          //                 Text(
          //                   'View',
          //                   style: h5.copyWith(
          //                     color: AppColors.green,
          //                     decoration: TextDecoration.underline,
          //                     decorationColor: AppColors.greenNormal,
          //                     decorationThickness: 2,
          //                   ),
          //                 ),
          //               ],
          //             ),
          //             sh20,
          //             Row(
          //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //               children: [
          //                 Expanded(
          //                   child: Text(
          //                     'Vegetable Burger',
          //                     style: h3,
          //                     maxLines: 1,
          //                     overflow: TextOverflow.ellipsis,
          //                   ),
          //                 ),
          //                 sw5,
          //                 Container(
          //                   alignment: Alignment.center,
          //                   padding: EdgeInsets.symmetric(horizontal: 8),
          //                   height: 30.h,
          //                   color: AppColors.greenLight,
          //                   child: Text(
          //                     'New Deal',
          //                     style: h4.copyWith(
          //                       color: AppColors.greenNormal,
          //                     ),
          //                   ),
          //                 ),
          //               ],
          //             ),
          //             sh12,
          //             Text(
          //               'A veggie burger is a plant-based patty served in a burger bun, made from ingredients like vegetables legumes in beans.',
          //               style: h5,
          //               maxLines: 3,
          //               overflow: TextOverflow.ellipsis,
          //             ),
          //             sh16,
          //             ListTile(
          //               contentPadding: EdgeInsets.zero,
          //               leading: Image.asset(
          //                 AppImages.discount,
          //                 scale: 4,
          //               ),
          //               title: Text(
          //                 'Discount',
          //                 style: h5,
          //               ),
          //               trailing: Text(
          //                 '20%',
          //                 style: h5,
          //               ),
          //             ),
          //             ListTile(
          //               contentPadding: EdgeInsets.zero,
          //               leading: Image.asset(
          //                 AppImages.calender,
          //                 scale: 4,
          //               ),
          //               title: Text(
          //                 'Date',
          //                 style: h5,
          //               ),
          //               trailing: Text(
          //                 '23 sep 2025',
          //                 style: h5,
          //               ),
          //             ),
          //             ListTile(
          //               contentPadding: EdgeInsets.zero,
          //               leading: Image.asset(
          //                 AppImages.clock,
          //                 scale: 4,
          //               ),
          //               title: Text(
          //                 'Start time',
          //                 style: h5,
          //               ),
          //               trailing: Text(
          //                 '03:00 PM',
          //                 style: h5,
          //               ),
          //             ),
          //             Row(
          //               children: [
          //                 Expanded(
          //                   child: CustomButton(
          //                     text: 'Details',
          //                     onPressed: () {},
          //                     imageAssetPath: AppImages.details,
          //                     centerImageWithText: true,
          //                     gradientColors: AppColors.buttonColor,
          //                   ),
          //                 ),
          //                 sw8,
          //                 GestureDetector(
          //                   onTap: () {},
          //                   child: Image.asset(
          //                     AppImages.scanner,
          //                     scale: 4,
          //                   ),
          //                 ),
          //                 sw8,
          //                 GestureDetector(
          //                   onTap: () {},
          //                   child: Image.asset(
          //                     AppImages.bookmarkCircle,
          //                     scale: 4,
          //                   ),
          //                 ),
          //               ],
          //             )
          //           ],
          //         ),
          //       ),
          //     ],
          //   ),
          // )
        ],
      ),
    );
  }
}
