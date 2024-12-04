import 'dart:ui';

import 'package:events/screens/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
