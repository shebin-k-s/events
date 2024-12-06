import 'package:events/core/constants/colors.dart';
import 'package:events/core/constants/constants.dart';
import 'package:events/screens/home/widgets/categories_tile.dart';
import 'package:events/screens/home/widgets/nearby_events_tile.dart';
import 'package:events/screens/home/widgets/popular_events_tile.dart';
import 'package:events/screens/navbar_control/widgets/custom_bottom_navbar.dart';
import 'package:events/screens/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: Padding(
          padding: EdgeInsets.only(
            left: 20.w,
          ),
          child: SvgPicture.asset(
            "assets/icons/home/drawer.svg",
          ),
        ),
        title: Row(
          children: [
            SvgPicture.asset("assets/icons/home/appbar_location.svg"),
            SizedBox(width: 10.w),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  text: "You are in",
                  fontSize: 12,
                  fontColor: Colors.grey,
                  height: 1.6,
                ),
                Row(
                  children: [
                    CustomText(
                      text: "Kochi, Kerala",
                      fontSize: 14,
                      fontColor: Colors.grey,
                      height: 1.1,
                    ),
                    SizedBox(width: 9.w),
                    SvgPicture.asset(
                      "assets/icons/home/appbar_location_edit.svg",
                    )
                  ],
                ),
              ],
            ),
            Icon(Icons.edit),
            const Spacer(),
            SvgPicture.asset("assets/icons/home/chat.svg")
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 16.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Search Field
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "Search for events...",
                    prefixIcon: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 10.w, vertical: 12.w),
                      child: SvgPicture.asset("assets/icons/home/search.svg"),
                    ),
                    suffixIcon: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 10.w, vertical: 12.w),
                      child: SvgPicture.asset("assets/icons/home/filter.svg"),
                    ),
                    border: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.transparent),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.transparent),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.transparent),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    filled: true,
                    fillColor: const Color(0xFFF9FAFB),
                  ),
                ),
              ),
              SizedBox(height: 20.h),

              // Categories
              SizedBox(
                height: 40.h,
                child: ListView.builder(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  scrollDirection: Axis.horizontal,
                  itemCount: categories.length,
                  itemBuilder: (context, index) => Padding(
                    padding: EdgeInsets.only(right: 10.w),
                    child: CategoriesTile(
                      imageUrl: categories[index]["image"],
                      label: categories[index]["category"],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20.h),

              // Popular Events
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomText(
                      text: "Popular Events",
                      fontSize: 18.sp,
                      fontweight: FontWeight.w600,
                      fontColor: const Color(0xFF1F2937),
                    ),
                    CustomText(
                      text: "View all",
                      fontSize: 12.sp,
                      fontweight: FontWeight.w400,
                      fontColor: const Color(0xFF2563EB),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20.h),

              SizedBox(
                height: 242.w,
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => Padding(
                    padding: index == 0
                        ? EdgeInsets.only(left: 20.w, right: 5.w)
                        : EdgeInsets.only(right: 5.w),
                    child: PopularEventsTile(
                      event: nearbyEvents[index],
                    ),
                  ),
                  itemCount: nearbyEvents.length,
                ),
              ),
              SizedBox(height: 20.h),

              // Nearby Events
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomText(
                      text: "Events Nearby",
                      fontSize: 18.sp,
                      fontweight: FontWeight.w600,
                      fontColor: const Color(0xFF1F2937),
                    ),
                    CustomText(
                      text: "View all",
                      fontSize: 12.sp,
                      fontweight: FontWeight.w400,
                      fontColor: const Color(0xFF2563EB),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16.h),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10.w,
                    mainAxisSpacing: 10.w,
                    childAspectRatio: 175.w / 250.w,
                  ),
                  itemCount: nearbyEvents.length,
                  itemBuilder: (context, index) => NearbyEventsTile(
                    event: nearbyEvents[index],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
