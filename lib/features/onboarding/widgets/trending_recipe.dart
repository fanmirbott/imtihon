import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:imtihon/core/utils/AppColors/AppColors.dart';
import 'package:imtihon/features/onboarding/managers/TrendingProvider.dart';
import 'package:provider/provider.dart';

class TrendingRecipe extends StatefulWidget {
  const TrendingRecipe({super.key});

  @override
  State<TrendingRecipe> createState() => _TrendingRecipeState();
}

class _TrendingRecipeState extends State<TrendingRecipe> {
  bool like = false;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TrendingProvider(),
      child: Consumer<TrendingProvider>(
        builder: (context, vm, child) {
          if (vm.isLoading) {
            return Center(child: CircularProgressIndicator());
          }
          if (vm.trendingRecipe.isEmpty) {
            return Center(
              child: Text(
                "Ma'lumot topilmadi",
                style: TextStyle(fontSize: 20, color: AppColors().white),
              ),
            );
          }
          final recipe = vm.trendingRecipe.first;
          return Padding(
            padding: EdgeInsetsGeometry.symmetric(horizontal: 36),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 9,
              children: [
                Text(
                  'Trending Recipe',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: AppColors().redpinkmain,
                  ),
                ),
                SizedBox(
                  width: 358.w,
                  height: 182.h,
                  child: Stack(
                    children: [
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          padding: EdgeInsetsGeometry.only(
                            left: 12.w,
                            right: 10.w,
                            top: 20.h,
                          ),
                          width: 348.w,
                          height: 60.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(14.r),
                            border: Border.all(color: AppColors().pinksub),
                          ),
                          child: Row(
                            children: [
                              SizedBox(
                                width: 265.31.w,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      recipe.title,
                                      style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 13,
                                        color: AppColors().white,
                                      ),
                                    ),
                                    Text(
                                      recipe.description,
                                      maxLines: 1,
                                      style: TextStyle(
                                        overflow: TextOverflow.ellipsis,
                                        fontWeight: FontWeight.w300,
                                        fontSize: 13,
                                        color: AppColors().white,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Row(
                                    children: [
                                      SvgPicture.asset(
                                        'assets/Icons/clock.svg',
                                      ),
                                      SizedBox(width: 4),
                                      Text(
                                        recipe.timeRequired.toString(),
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
                                  Row(
                                    spacing: 4,
                                    children: [
                                      Text(
                                        recipe.rating.toString(),
                                        style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400,
                                          color: AppColors().pinksub,
                                        ),
                                      ),
                                      SvgPicture.asset('assets/Icons/star.svg'),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      ClipRRect(
                        borderRadius: BorderRadiusGeometry.circular(14),
                        child: Stack(
                          children: [
                            Image.network(
                              recipe.photo,
                              width: 358.w,
                              height: 143.h,
                              fit: BoxFit.cover,
                            ),
                            Positioned(
                              top: 7,
                              left: 322,
                              child: GestureDetector(
                                onTap: () {
                                  like =! like;
                                  setState(() {

                                  });
                                },
                                child: Container(
                                  width: 28.w,
                                  height: 28.h,
                                  decoration: BoxDecoration(
                                    color: like ? AppColors().redpinkmain : AppColors().pink,
                                    shape: BoxShape.circle,
                                  ),
                                  child: SvgPicture.asset(
                                      'assets/Icons/like.svg',
                                      width: 15.w,
                                      height: 15.h,
                                      fit: BoxFit.none,
                                      color: like? AppColors().white : AppColors().pinksub
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
