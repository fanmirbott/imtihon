import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:imtihon/core/utils/AppColors.dart';
import 'package:imtihon/features/onboarding/managers/YourRecipeProvider.dart';
import 'package:provider/provider.dart';

class YourRecipes extends StatelessWidget {
  const YourRecipes({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => YourRecipeProvider(),
      child: Consumer<YourRecipeProvider>(
        builder: (context, vm, child) {
          if (vm.isLoading) {
            return Center(child: CircularProgressIndicator());
          }
          if (vm.yourRecipe.isEmpty) {
            return Center(child: Text("Ma'lumot topilmadi"));
          }
          return
          Container(
            padding: EdgeInsetsGeometry.symmetric(
              horizontal: 37.w,
              vertical: 14,
            ),
            width: 430.w,
            height: 255.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadiusGeometry.circular(20.r),
              color: AppColors().redpinkmain,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 9,
              children: [
                Text(
                  'Your recipes',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 15,
                    color: AppColors().white,
                  ),
                ),
                Row(
                  spacing: 16.95,
                  children: [
                    ...List.generate(vm.yourRecipe.length, (index) {
                      return SizedBox(
                        width: 168.52.w,
                        height: 195.h,
                        child: Stack(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadiusGeometry.circular(14),
                              child: Image.network(
                                vm.yourRecipe[index].photo,
                                width: 168.52,
                                height: 162,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Align(
                              alignment: Alignment.bottomCenter,
                              child: Container(
                                padding: EdgeInsetsGeometry.symmetric(
                                  horizontal: 15,
                                ),
                                width: 168.52.w,
                                height: 48.h,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadiusGeometry.circular(
                                    13.r,
                                  ),
                                  color: AppColors().white,
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(vm.yourRecipe[index].title),
                                    Row(
                                      spacing: 26,
                                      children: [
                                        Row(
                                          spacing: 4,
                                          children: [
                                            Text(
                                              vm.yourRecipe[index].rating
                                                  .toString(),
                                              style: TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.w400,
                                                color: AppColors().pinksub,
                                              ),
                                            ),
                                            SvgPicture.asset(
                                              'assets/Icons/star.svg',
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            SvgPicture.asset(
                                              'assets/Icons/clock.svg',
                                            ),
                                            SizedBox(width: 4),
                                            Text(
                                              vm.yourRecipe[index].timeRequired
                                                  .toString(),
                                              style: TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.w400,
                                                color: AppColors().pinksub,
                                              ),
                                            ),
                                            Text(
                                              'min',
                                              style: TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.w400,
                                                color: AppColors().pinksub,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    }),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
