import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.textController,
    required this.hintText,
    this.prefixIcon,
    this.prefixIconColor = Colors.grey,
    this.prefixIconSize,
    required this.errorText,
    this.focusedBorderColor = Colors.purple,
    this.borderWidth = 1,
    this.borderColor = Colors.blue,
    this.borderRadius = 15,
    this.obscureText = false,
  });

  final TextEditingController textController;
  final String hintText;
  final IconData? prefixIcon;
  final Color? prefixIconColor;
  final double? prefixIconSize;
  final String errorText;
  final Color? focusedBorderColor;
  final Color? borderColor;
  final double? borderWidth;
  final double? borderRadius;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textController,
      obscureText: obscureText,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: borderColor ?? Colors.grey,
            width: borderWidth ?? 1,
          ),
          borderRadius: BorderRadius.circular(
            borderRadius ?? 4,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: focusedBorderColor ?? Colors.grey,
            width: borderWidth ?? 1,
          ),
          borderRadius: BorderRadius.circular(
            borderRadius ?? 4,
          ),
        ),
        prefixIcon: prefixIcon != null
            ? Icon(
                prefixIcon,
                color: prefixIconColor,
                size: prefixIconSize,
              )
            : null,
        hintText: hintText,
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return errorText;
        }
        return null;
      },
    );
  }
}
