import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:imtihon/core/utils/AppColors/AppColors.dart';
import 'package:imtihon/features/onboarding/pages/LaunchPage.dart';
import 'package:imtihon/features/onboarding/pages/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(430, 932),
      child: MaterialApp(
        theme: ThemeData(
            scaffoldBackgroundColor: AppColors().backgroundBeige),
        debugShowCheckedModeBanner: false,
        home: LaunchPage(),
      ),
    );
  }
}
