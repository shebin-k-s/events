import 'package:events/screens/widgets/custom_text.dart';
import 'package:flutter/material.dart';


class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({
    super.key,
    required this.height,
    required this.width,
    this.iconWidget,
    required this.onPressed,
    required this.backgroundColor,
    required this.label,
    required this.labelColor,
    required this.labelSize,
    this.borderRadius = 10,
  });
  final double height;
  final double width;
  final Widget? iconWidget;
  final void Function() onPressed;
  final Color backgroundColor;
  final String label;
  final Color labelColor;
  final double labelSize;
  final double borderRadius;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(backgroundColor),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius),
            ),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (iconWidget != null) iconWidget!,
            if (iconWidget != null) const SizedBox(width: 5),
            CustomText(
              text: label,
              fontSize: labelSize,
              fontColor: labelColor,
              fontweight: FontWeight.w600,
            ),
          ],
        ),
      ),
    );
  }
}