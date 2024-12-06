import 'dart:ui';

import 'package:events/screens/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class NearbyEventsTile extends StatelessWidget {
  const NearbyEventsTile({super.key, required this.event});

  final Map event;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10.r),
      child: Container(
        height: 250.w,
        width: 175.w,
        child: Stack(
          children: [
            Positioned.fill(
              child: Image(
                image: NetworkImage(event["image"]),
                fit: BoxFit.cover,
              ),
            ),

            // upper section - category

            Positioned(
              top: 5.w,
              left: 5.w,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(30.r),
                child: BackdropFilter(
                  filter: ImageFilter.blur(
                      sigmaX: 19.2, sigmaY: 19.2, tileMode: TileMode.decal),
                  child: Container(
                    height: 24.w,
                    width: 50.w,
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.66),
                    ),
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.w),
                      child: CustomText(
                        text: event["category"],
                        fontSize: 10.sp,
                        fontColor: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ),

            // upper section - like

            Positioned(
              top: 5.w,
              right: 5.w,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(30.r),
                child: BackdropFilter(
                  filter: ImageFilter.blur(
                      sigmaX: 19.2, sigmaY: 19.2, tileMode: TileMode.decal),
                  child: Container(
                    height: 24.w,
                    width: 24.w,
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.66),
                    ),
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 6.w, vertical: 7.w),
                      child:
                          SvgPicture.asset("assets/icons/others/favourite.svg"),
                    ),
                  ),
                ),
              ),
            ),

            // bottom section
            Positioned(
              bottom: 0,
              child: ClipRRect(
                child: BackdropFilter(
                  filter: ImageFilter.blur(
                      sigmaX: 17.4, sigmaY: 17.4, tileMode: TileMode.decal),
                  child: Container(
                    height: 58.w,
                    width: 175.w,
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.6),
                    ),
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText(
                            text: event["title"],
                            fontSize: 12.sp,
                            fontweight: FontWeight.w600,
                            fontColor: Colors.white,
                          ),
                          Row(
                            children: [
                              SvgPicture.asset(
                                  "assets/icons/others/location.svg"),
                              SizedBox(width: 3.w),
                              CustomText(
                                text: event["place"],
                                fontSize: 10.sp,
                                fontColor: Colors.white,
                              ),
                              SizedBox(width: 3.w),
                              CircleAvatar(
                                radius: 2.r,
                                backgroundColor: Colors.white,
                              ),
                              SizedBox(width: 3.w),
                              CustomText(
                                text: event["date"],
                                fontSize: 10.sp,
                                fontColor: Colors.white,
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              SvgPicture.asset(
                                  "assets/icons/others/person_with_tick.svg"),
                              SizedBox(width: 3.w),
                              CustomText(
                                text: "${event["capacity"]}+",
                                fontSize: 10.sp,
                                fontColor: Colors.white,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
