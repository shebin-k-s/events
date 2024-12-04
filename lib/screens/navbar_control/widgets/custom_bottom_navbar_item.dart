import 'package:events/screens/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class CustomBottomNavbarItem extends StatelessWidget {
  CustomBottomNavbarItem({
    super.key,
    required this.iconPath,
    required this.index,
    required this.label,
  });
  final String iconPath;
  final String label;

  final int index;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          // controller.bottomNavbarIndex.value = index;
        },
        child: SizedBox(
          width: 70.w,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(iconPath),
              CustomText(
                text: label,
                fontSize: 12.sp,
              ),
            ],
          ),
        ));
  }
}
