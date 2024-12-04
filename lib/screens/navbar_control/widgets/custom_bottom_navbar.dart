import 'dart:developer';

import 'package:events/screens/navbar_control/widgets/custom_bottom_navbar_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  CustomBottomNavigationBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // print("value ${bottomNavbarIndexNotifier.value}");
    return Container(
      height: 70.w,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(21.r),
          topRight: Radius.circular(21.r),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            CustomBottomNavbarItem(
              iconPath: "assets/icons/bottom_navbar/unselected_home.svg",
              label: "Home",
              index: 0,
            ),
            CustomBottomNavbarItem(
              iconPath: "assets/icons/bottom_navbar/unselected_explore.svg",
              label: "Explore",
              index: 1,
            ),
            CustomBottomNavbarItem(
              iconPath:
                  "assets/icons/bottom_navbar/unselected_notification.svg",
              label: "Notification",
              index: 2,
            ),
            CustomBottomNavbarItem(
              iconPath: "assets/icons/bottom_navbar/unselected_myevents.svg",
              label: "My Events",
              index: 3,
            ),
            CustomBottomNavbarItem(
              iconPath: "assets/icons/bottom_navbar/unselected_profile.svg",
              label: "Profile",
              index: 4,
            ),
          ],
        ),
      ),
    );
  }
}
