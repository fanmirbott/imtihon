import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:imtihon/features/onboarding/managers/homePageProvider.dart';
import 'package:provider/provider.dart';

import '../../../../core/utils/AppColors.dart';

class CategoryBottomBar extends StatefulWidget implements PreferredSizeWidget {
  const CategoryBottomBar({super.key});

  @override
  Size get preferredSize => Size.fromHeight(46.h);

  @override
  State<CategoryBottomBar> createState() => _CategoryBottomBarState();
}

class _CategoryBottomBarState extends State<CategoryBottomBar> {
  int activCategory = 0;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => HomePageProvider(),
      builder: (context, child) => Consumer<HomePageProvider>(
        builder: (context, vm, child) => Padding(
          padding: EdgeInsetsGeometry.only(left: 12, right: 30),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(vm.categories.length, (index) {
                return TextButton(
                  onPressed: () {
                    setState(() {
                      activCategory = index;
                    });
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          "Tanlangan kategoriya: ${vm.categories[index].title}",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    );
                  },
                  child: Container(
                    height: 25,
                    padding: EdgeInsets.symmetric(horizontal: 12.w),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(18.r),
                      color: activCategory == index
                          ? AppColors().redpinkmain
                          : Colors.transparent,
                    ),
                    child: Center(
                      child: Text(
                        vm.categories[index].title,
                        style: TextStyle(
                          color: activCategory == index
                              ? AppColors().white
                              : AppColors().redpinkmain,
                        ),
                      ),
                    ),
                  ),
                );
              }),
            ),
          ),
        ),
      ),
    );
  }
}
