import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:imtihon/features/onboarding/managers/RecentlyAddedProvider.dart';
import 'package:provider/provider.dart';

import '../../../core/utils/AppColors/AppColors.dart';

class RecentlyAdded extends StatefulWidget {
  RecentlyAdded({super.key});

  @override
  State<RecentlyAdded> createState() => _RecentlyAddedState();
}

class _RecentlyAddedState extends State<RecentlyAdded> {
  int like = 0;
  List<bool> likedStates = [];


  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => RecentlyAddedProvider(),
      child: Consumer<RecentlyAddedProvider>(
        builder: (context, vm, child) {
          if (likedStates.length != vm.recentlyAdded.length) {
            likedStates = List.filled(vm.recentlyAdded.length, false);
          }          if (vm.isLoading) {
            return Center(child: CircularProgressIndicator());
          }
          if (vm.recentlyAdded.isEmpty) {
            return Center(child: Text("Ma'lumot topilmadi"));
          }
          return Padding(
            padding: EdgeInsetsGeometry.symmetric(horizontal: 36),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Recently Added',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 15,
                    color: AppColors().redpinkmain,
                  ),
                ),
                Row(
                  spacing: 16.95,
                  children: [
                    ...List.generate(vm.recentlyAdded.length, (index) {
                      return SizedBox(
                        width: 168.52.w,
                        height: 195.h,
                        child: Stack(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadiusGeometry.circular(14),
                              child: Stack(
                                children: [
                                  Image.network(
                                    vm.recentlyAdded[index].photo,
                                    width: 168.52.w,
                                    height: 162.h,
                                    fit: BoxFit.cover,
                                  ),
                                  Positioned(
                                    top: 7.h,
                                    left: 132.w,
                                    child: GestureDetector(
                                      onTap: () {
                                        likedStates[index] = !likedStates[index];
                                        setState(() {
                                        });
                                      },
                                      child: Container(
                                        width: 28.w,
                                        height: 28.h,
                                        decoration: BoxDecoration(
                                          color: likedStates[index]? AppColors().redpinkmain : AppColors().pink,
                                          shape: BoxShape.circle,
                                        ),
                                        child: SvgPicture.asset(
                                          'assets/Icons/like.svg',
                                          width: 15.w,
                                          height: 15.h,
                                          fit: BoxFit.none,
                                          color: likedStates[index] ? AppColors().white : AppColors().pinksub
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
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
                                    Text(vm.recentlyAdded[index].title),
                                    Row(
                                      spacing: 26,
                                      children: [
                                        Row(
                                          spacing: 4,
                                          children: [
                                            Text(
                                              vm.recentlyAdded[index].rating
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
                                              vm
                                                  .recentlyAdded[index]
                                                  .timeRequired
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
