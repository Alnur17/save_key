// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
//
// import 'package:get/get.dart';
// import 'package:save_key/common/size_box/custom_sizebox.dart';
//
// import '../../../../../common/app_color/app_colors.dart';
// import '../../../../../common/app_images/app_images.dart';
// import '../../../../../common/app_text_style/styles.dart';
// import '../../../../../common/widgets/details_widget.dart';
// import '../controllers/favorite_controller.dart';
//
// class FavoriteView extends GetView<FavoriteController> {
//   const FavoriteView({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppColors.white,
//       appBar: AppBar(
//         backgroundColor: AppColors.white,
//         scrolledUnderElevation: 0,
//         title: Text(
//           'Favorite',
//           style: appBarStyle,
//         ),
//         leading: GestureDetector(
//             onTap: () {
//               Get.back();
//             },
//             child: Image.asset(
//               AppImages.back,
//               scale: 4,
//             )),
//       ),
//       body: Container(
//         margin: EdgeInsets.symmetric(horizontal: 20, vertical: 12).r,
//         padding: EdgeInsets.all(16).r,
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(12),
//           color: AppColors.silver,
//         ),
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             Row(
//               children: [
//                 Container(
//                   height: 120.h,
//                   width: 90.w,
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(8),
//                     color: AppColors.grey,
//                   ),
//                   child: ClipRRect(
//                     borderRadius: BorderRadius.circular(8),
//                     child: CachedNetworkImage(
//                       imageUrl: AppImages.foodImage,
//                       scale: 4,
//                       fit: BoxFit.cover,
//                     ),
//                   ),
//                 ),
//                 sw12,
//                 Expanded(
//                   child: Column(
//                     children: [
//                       Row(
//                         children: [
//                           CircleAvatar(
//                             radius: 24,
//                             backgroundImage: CachedNetworkImageProvider(
//                               AppImages.profileImageTwo,
//                               scale: 4,
//                             ),
//                           ),
//                           sw8,
//                           Expanded(
//                             child: Text(
//                               'Daily Daawat-Gulshan 1',
//                               style: h3,
//                               maxLines: 1,
//                               overflow: TextOverflow.ellipsis,
//                             ),
//                           ),
//                         ],
//                       ),
//                       sh5,
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Expanded(
//                             child: Text(
//                               'Vegetable Burger',
//                               style: h3,
//                               maxLines: 1,
//                               overflow: TextOverflow.ellipsis,
//                             ),
//                           ),
//                           sw5,
//                           Container(
//                             alignment: Alignment.center,
//                             padding: EdgeInsets.symmetric(horizontal: 8),
//                             height: 30.h,
//                             color: AppColors.greenLight,
//                             child: Text(
//                               'New Deal',
//                               style: h4.copyWith(color: AppColors.greenNormal),
//                             ),
//                           ),
//                         ],
//                       ),
//                       Text(
//                         'A veggie burger is a plant-based burger bun, made from ingredient',
//                         style: h5,
//                         maxLines: 2,
//                         overflow: TextOverflow.ellipsis,
//                       ),
//                     ],
//                   ),
//                 )
//               ],
//             ),
//             sh12,
//             Row(
//               crossAxisAlignment: CrossAxisAlignment.end,
//               children: [
//                 Expanded(
//                   child: Column(
//                     children: [
//                       DetailsWidget(
//                         iconAsset: AppImages.discount,
//                         label: 'Discount',
//                         time: '20%',
//                       ),
//                       sh12,
//                       DetailsWidget(
//                         iconAsset: AppImages.calender,
//                         label: 'Date',
//                         time: '23 sep 2025',
//                       ),
//                       sh12,
//                       DetailsWidget(
//                         iconAsset: AppImages.clock,
//                         label: 'Start time',
//                         time: '06:00 PM',
//                       ),
//                     ],
//                   ),
//                 ),
//                 sw16,
//                 GestureDetector(
//                   onTap: () {},
//                   child: Image.asset(
//                     AppImages.deleteCircle,
//                     scale: 4,
//                   ),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../../common/app_color/app_colors.dart';
import '../../../../../common/app_images/app_images.dart';
import '../../../../../common/app_text_style/styles.dart';
import '../../../../../common/helper/favorite_item_card.dart';
import '../controllers/favorite_controller.dart';

class FavoriteView extends GetView<FavoriteController> {
  const FavoriteView({super.key});

  @override
  Widget build(BuildContext context) {
    final favoriteList = [
      {
        'image': AppImages.foodImage,
        'restaurant': 'Daily Daawat-Gulshan 1',
        'item': 'Vegetable Burger',
        'description': 'A veggie burger is a plant-based burger bun, made from ingredient',
        'status': 'New Deal',
        'discount': '20%',
        'date': '23 Sep 2025',
        'time': '06:00 PM',
        'profile': AppImages.profileImageTwo,
      },
      {
        'image': AppImages.foodImage,
        'restaurant': 'Burger House-Banani',
        'item': 'Cheese Burger',
        'description': 'Juicy burger with cheese, lettuce, and tomato',
        'status': 'Expire',
        'discount': '15%',
        'date': '10 Oct 2025',
        'time': '02:00 PM',
        'profile': AppImages.profileImageTwo,
      },
      {
        'image': AppImages.foodImage,
        'restaurant': 'Daily Daawat-Gulshan 1',
        'item': 'Vegetable Burger',
        'description': 'A veggie burger is a plant-based burger bun, made from ingredient',
        'status': 'New Deal',
        'discount': '20%',
        'date': '23 Sep 2025',
        'time': '06:00 PM',
        'profile': AppImages.profileImageTwo,
      },
    ];

    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        scrolledUnderElevation: 0,
        title: Text('Favorite', style: appBarStyle),
        titleSpacing: 20.w,
        // leading: GestureDetector(
        //   onTap: Get.back,
        //   child: Image.asset(AppImages.back, scale: 4),
        // ),
      ),
      body: ListView.builder(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12).r,
        itemCount: favoriteList.length,
        itemBuilder: (context, index) {
          final item = favoriteList[index];
          return FavoriteItemCard(
            imageUrl: item['image']!,
            restaurantName: item['restaurant']!,
            itemName: item['item']!,
            description: item['description']!,
            status: item['status']!,
            discount: item['discount']!,
            date: item['date']!,
            startTime: item['time']!,
            profileImage: item['profile']!,
            onDelete: () {
              print('Deleted ${item['item']}');
            },
          );
        },
      ),
    );
  }
}
