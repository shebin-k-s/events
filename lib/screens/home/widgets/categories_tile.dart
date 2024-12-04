
import 'package:events/core/constants/colors.dart';
import 'package:events/screens/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoriesTile extends StatelessWidget {

  final String imageUrl;
  final String label;

  const CategoriesTile({
    super.key, required this.imageUrl, required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40.w,
      width: 100.w,
      decoration: BoxDecoration(
        color: lightGreyColor,
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: 10.w, vertical: 12.w),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(3.r),
              child: SizedBox(
                height: 16.w,
                width: 16.w,
                child: Image(
                  image: NetworkImage(
imageUrl                  ),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            SizedBox(
              width: 7.w,
            ),
            CustomText(
              text: label,
              fontColor: darkGreyColor,
              fontSize: 12.sp,
              fontweight: FontWeight.w500,
            )
          ],
        ),
      ),
    );
  }
}
