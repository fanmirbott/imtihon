import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:imtihon/features/common/appDetails/AppBar/app_bar_home_page.dart';
import 'package:imtihon/features/onboarding/managers/homePageProvider.dart';
import 'package:imtihon/features/common/appDetails/BottomNavigationBar/bottom_nav_bar.dart';
import 'package:imtihon/features/onboarding/widgets/recently_added.dart';
import 'package:imtihon/features/onboarding/widgets/top_chef.dart';
import 'package:imtihon/features/onboarding/widgets/trending_recipe.dart';
import 'package:imtihon/features/onboarding/widgets/your_recipes.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => HomePageProvider(),
      child: Consumer<HomePageProvider>(
        builder: (context, vm, child) => Scaffold(
          extendBody: true,
          appBar: AppBarHomePage(),
          bottomNavigationBar: BottomNavBar(),
          body: SingleChildScrollView(
            child: Column(
              children: [
                TrendingRecipe(),
                SizedBox(height: 19.h),
                YourRecipes(),
                SizedBox(height: 19.h),
                TopChef(),
                SizedBox(height: 19.h),
                RecentlyAdded(),
                SizedBox(height: 100.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
