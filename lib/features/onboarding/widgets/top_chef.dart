import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:imtihon/core/utils/AppColors.dart';
import 'package:imtihon/features/onboarding/managers/TopChefProvider.dart';
import 'package:provider/provider.dart';

class TopChef extends StatelessWidget {
  const TopChef({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TopChefProvider(),
      child: Consumer<TopChefProvider>(
        builder: (context, vm, child) {
          if (vm.isLoading) {
            return Center(child: CircularProgressIndicator());
          }
          if (vm.topChef.isEmpty) {
            return Center(child: Text("Ma'lumot topilmadi"));
          }
          return Padding(
            padding: EdgeInsetsGeometry.symmetric(horizontal: 36.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 10.h,
              children: [
                Text(
                  'Top Chef',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 15,
                    color: AppColors().redpinkmain,
                  ),
                ),
                Row(
                  spacing: 9,
                  children: [
                    ...List.generate(vm.topChef.length, (index) {
                      return Column(
                        spacing: 2.h,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadiusGeometry.circular(6),
                            child: Image.network(
                              vm.topChef[index].profilePhoto,
                              width: 82.69.w,
                              height: 74.h,
                            ),
                          ),
                          Text(
                            vm.topChef[index].firstName,
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: AppColors().white,
                            ),
                          ),
                        ],
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
