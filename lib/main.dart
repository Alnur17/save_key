import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'app/routes/app_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();

  runApp(
    ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: "SaveKey",
        initialRoute: AppPages.INITIAL,
        getPages: AppPages.routes,
      ),
    ),
  );
}

//
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';
// import 'package:get_storage/get_storage.dart';
//
// import 'app/routes/app_pages.dart';
//
// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await GetStorage.init();
//
//   runApp(const MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return LayoutBuilder(
//       builder: (context, constraints) {
//         final isTablet = constraints.maxWidth >= 600;
//
//         return ScreenUtilInit(
//           designSize: isTablet
//               ? const Size(1024, 1366) // Tablet base design
//               : const Size(375, 812),  // Mobile base design
//           minTextAdapt: true,
//           splitScreenMode: true,
//           builder: (context, child) {
//             return GetMaterialApp(
//               debugShowCheckedModeBanner: false,
//               title: "SaveKey",
//               initialRoute: AppPages.INITIAL,
//               getPages: AppPages.routes,
//               builder: (context, widget) {
//                 final shortestSide = MediaQuery.of(context).size.shortestSide;
//
//                 return MediaQuery(
//                   data: MediaQuery.of(context).copyWith(
//                     textScaler: TextScaler.linear(
//                       shortestSide < 600 ? 1.0 : 1.3,
//                     ),
//                   ),
//                   child: widget!,
//                 );
//               },
//             );
//           },
//         );
//       },
//     );
//   }
// }
//
