import 'dart:ui';

import 'package:events/screens/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class PopularEventsTile extends StatelessWidget {
  const PopularEventsTile({super.key, required this.event});

  final Map event;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10.r),
      child: Container(
        height: 242.w,
        width: 168.w,
        child: Stack(
          children: [
            Positioned.fill(
              child: Image(
                image: NetworkImage(event["image"]),
                fit: BoxFit.cover,
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
                    height: 50.w,
                    width: 168.w,
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.6),
                    ),
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.w),
                      child: Row(
                        children: [
                          Column(
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
                            ],
                          ),
                          Spacer(),
                          Container(
                            height: 24.w,
                            width: 24.w,
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.29),
                              border: Border.all(
                                width: 1.w,
                                color: Colors.white.withOpacity(0.1),
                              ),
                              borderRadius: BorderRadius.circular(30.r),
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(5.w),
                              child: SvgPicture.asset(
                                  "assets/icons/others/favourite.svg"),
                            ),
                          )
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
