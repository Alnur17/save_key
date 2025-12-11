import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:save_key/app/modules/member/home/views/gallery_image_view.dart';
import 'package:save_key/common/app_color/app_colors.dart';
import 'package:save_key/common/app_text_style/styles.dart';
import 'package:save_key/common/size_box/custom_sizebox.dart';


class BusinessProfileView extends StatelessWidget {
  const BusinessProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SingleChildScrollView(
        child:  Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Top Gradient Header
            Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  height: 200,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(bottomLeft: Radius.circular(50), bottomRight:  Radius.circular(50)),
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color(0xFF556D55), // #556D55
                        Color(0xFF76A976), // #76A976
                      ],
                    ),
                  ),

                ),

                Positioned(
                  bottom: -150,
                  right: 0,
                  left: 0,
                  child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 40.h),
                  child: Column(

                    children: [
                      // Profile Image with Orange Border
                      Container(
                        padding: EdgeInsets.all(6.w),
                        decoration:  BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.orange.withValues(alpha: 0.5), // Orange circle border
                        ),
                        child: CircleAvatar(
                          radius: 36.r,
                          backgroundImage: const NetworkImage(
                            "https://plus.unsplash.com/premium_photo-1689568126014-06fea9d5d341?q=80&w=1470&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D", // Replace with real image
                          ),
                        ),
                      ),
                      sh10,
                      // Name
                      Text(
                        "Coffee Haven",
                        style: h3
                      ),
                      sh30,
                    ],
                  ),
                ),)
              ],
            ),

sh50,

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  sh30,

                  // About Section
                 Container(
                   decoration: BoxDecoration(
                     color: AppColors.grey.withValues(alpha: 0.1),
                     borderRadius: BorderRadius.circular(10)
                   ),
                   child: Padding(
                     padding: const EdgeInsets.all(12.0),
                     child: Column(
                       crossAxisAlignment: CrossAxisAlignment.start,
                       children: [
                         Text("About:", style: h3),
                         sh12,
                         Text(
                           "I have a 4 years old golden retriever. I've taken good care of him since he was 8 weeks old. He's very playful and super friendly to any dogs and people. My dog is particularly adept at fostering positive interactions, demonstrating a calm and considerate demeanor with small dogs.",
                           style: GoogleFonts.poppins(
                             fontSize: 14.sp,
                             height: 1.6,
                             color: AppColors.greyMedium,
                           ),
                         ),
                       ],
                     ),
                   ),
                 ),
                  sh20,

                  // Contact Information
                 Container(
                   width: double.infinity,
                   decoration: BoxDecoration(
                       color: AppColors.grey.withValues(alpha: 0.1),
                       borderRadius: BorderRadius.circular(10)
                   ),
                   child: Padding(
                     padding: const EdgeInsets.all(12.0),
                     child: Column(
                       crossAxisAlignment: CrossAxisAlignment.start,
                       children: [
                         Text("Contact Information:", style: h3),
                         sh16,
                         _buildContactRow(Icons.phone, "+880321 5646"),
                         sh12,
                         _buildContactRow(Icons.email, "yourmail.com"),
                         sh12,
                         _buildContactRow(Icons.location_on, "Mohakhali, Dhaka"),
                       ],
                     ),
                   ),
                 ),
                  sh20,

                  // Services
                 Container(
                   width: double.infinity,
                   decoration: BoxDecoration(
                       color: AppColors.grey.withValues(alpha: 0.1),
                       borderRadius: BorderRadius.circular(10)
                   ),
                   child: Padding(
                     padding: const EdgeInsets.all(12.0),
                     child: Column(
                       crossAxisAlignment: CrossAxisAlignment.start,
                       children: [
                         Text("Services:", style: h3),
                         sh16,
                         Wrap(
                           spacing: 12.w,
                           runSpacing: 12.h,
                           children: [
                             _serviceChip("Wedding Photography"),
                             _serviceChip("Event Coverage"),
                             _serviceChip("Photo Editing"),
                             _serviceChip("Albums & Prints"),
                             _serviceChip("Portrait Sessions"),
                           ],
                         ),
                       ],
                     ),
                   ),
                 ),
                  sh20,

                  // Portfolio Section
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Gallery", style: h3),
                      TextButton(
                        onPressed: () {
                          Get.to(() => GalleryImageView());
                        },
                        child: Text(
                          "See all",
                          style: GoogleFonts.poppins(
                            fontSize: 14.sp,
                            color: AppColors.greenLight,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                  sh16,

                  // Portfolio Images
                  SizedBox(
                    height: 120.h,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemCount: 5, // demo
                      separatorBuilder: (_, __) => sw16,
                      itemBuilder: (context, index) {
                        return ClipRRect(
                          borderRadius: BorderRadius.circular(12.r),
                          child: Container(
                            width: 160.w,
                            color: Colors.grey[300],
                            child: Image.network(
                              "https://plus.unsplash.com/premium_photo-1765356274742-04b452bb93c4?q=80&w=687&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
                              fit: BoxFit.cover,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  sh100, // bottom padding
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildContactRow(IconData icon, String text) {
    return Row(
      children: [
        Icon(icon, color: AppColors.greenNormal, size: 20.w),
        sw12,
        Text(
          text,
          style: GoogleFonts.poppins(
            fontSize: 15.sp,
            color: AppColors.greyMedium,
          ),
        ),
      ],
    );
  }

  Widget _serviceChip(String label) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
      decoration: BoxDecoration(
        color: const Color(0xFFD7DCD8),
        borderRadius: BorderRadius.circular(4.r),
        border: Border.all(color: const Color(0xFFE0E0E0)),
      ),
      child: Text(
        label,
        style: GoogleFonts.poppins(
          fontSize: 13.sp,
          color: AppColors.textColor,
        ),
      ),
    );
  }
}