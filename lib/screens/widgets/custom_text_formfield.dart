import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.textController,
    required this.labelText,
    this.prefixIcon,
    this.prefixIconColor = Colors.blue,
    this.prefixIconSize,
    required this.errorText,
    this.focusedBorderColor = Colors.purple,
    this.borderWidth = 1,
    this.borderColor = Colors.blue,
    this.borderRadius = 15,
    this.obscureText = false,
    this.readOnly = false,
  });

  final TextEditingController textController;
  final String labelText;
  final IconData? prefixIcon;
  final Color? prefixIconColor;
  final double? prefixIconSize;
  final String errorText;
  final Color focusedBorderColor;
  final Color borderColor;
  final double borderWidth;
  final double borderRadius;
  final bool obscureText;
  final bool readOnly;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textController,
      obscureText: obscureText,
      readOnly: readOnly,
      decoration: InputDecoration(
        labelText: labelText,
        floatingLabelBehavior: FloatingLabelBehavior.auto,
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: borderColor,
            width: borderWidth,
          ),
          borderRadius: BorderRadius.circular(
            borderRadius,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: borderColor,
            width: borderWidth,
          ),
          borderRadius: BorderRadius.circular(
            borderRadius,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: focusedBorderColor,
            width: borderWidth,
          ),
          borderRadius: BorderRadius.circular(
            borderRadius,
          ),
        ),
        prefixIcon: prefixIcon != null
            ? Icon(
                prefixIcon,
                color: prefixIconColor,
                size: prefixIconSize,
              )
            : null,
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
