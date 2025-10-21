import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:save_key/common/app_images/app_images.dart';
import 'package:save_key/common/app_text_style/styles.dart';
import 'package:save_key/common/widgets/custom_button.dart';
import '../../../../../common/app_color/app_colors.dart';
import '../../../../../common/size_box/custom_sizebox.dart';
import '../../../../../common/widgets/details_widget.dart';
import '../controllers/scan_controller.dart';

class ScanView extends StatelessWidget {
  const ScanView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ScanController());

    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        scrolledUnderElevation: 0,
        toolbarHeight: 10,
      ),
      body: Obx(() {
        if (controller.isScanned.value) {
          return _QrDetailsView(controller: controller);
        } else if (controller.isScanning.value) {
          return _MobileScannerView(controller: controller);
        } else {
          return _QrScannerView(controller: controller);
        }
      }),
    );
  }
}

class _QrScannerView extends StatelessWidget {
  final ScanController controller;

  const _QrScannerView({required this.controller});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12).r,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12).r,
            child: Text(
              'Scan QR Code',
              style: appBarStyle,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12).r,
            child: Image.asset(
              AppImages.scanImage,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12).r,
            child: CustomButton(
              text: 'Scan Now',
              onPressed: controller.startScanning,
              gradientColors: AppColors.buttonColor,
            ),
          ),
        ],
      ),
    );
  }
}

class _MobileScannerView extends StatelessWidget {
  final ScanController controller;

  const _MobileScannerView({required this.controller});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        MobileScanner(
          onDetect: (BarcodeCapture capture) {
            final barcode = capture.barcodes.firstOrNull;
            if (barcode != null && barcode.rawValue != null) {
              controller.setScannedData(barcode.rawValue!);
            }
          },
        ),
        Align(
          alignment: Alignment.topCenter,
          child: Padding(
            padding: const EdgeInsets.only(top: 40),
            child: Text(
              'Point the camera at a QR Code',
              style: h3.copyWith(
                color: AppColors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _QrDetailsView extends StatelessWidget {
  final ScanController controller;

  const _QrDetailsView({required this.controller});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'QR Code Details',
            style: appBarStyle,
          ),
          sh20,
          Column(
            children: [
              SizedBox(
                height: 200,
                width: 200,
                child: Image.asset(
                  AppImages.qrcode,
                  scale: 4,
                  fit: BoxFit.contain,
                ),
              ),
              sh20,
              Text(
                controller.scannedValue.value,
                textAlign: TextAlign.center,
                style: h5,
              ),
              sh20,
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
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 12).r,
                child: CustomButton(
                  text: 'Scan Again',
                  onPressed: controller.resetScanner,
                  gradientColors: AppColors.buttonColor,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
