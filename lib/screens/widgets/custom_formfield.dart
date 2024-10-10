
import 'package:flutter/material.dart';

class CustomFormField extends StatelessWidget {
  final String label;
  final String hintText;
  final bool hide;
  final TextEditingController controller;

  const CustomFormField({
    super.key,
    required this.label,
    required this.hintText,
    this.hide = false,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 8, bottom: 8),
          child: Text(
            label,
            style: const TextStyle(fontSize: 16),
          ),
        ),
        TextField(
          controller: controller,
          obscureText: hide,
          
        
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: const TextStyle(
              fontSize: 14,
              color: Colors.grey
            ),
            fillColor: Colors.grey[200],
            filled: true,
            
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(25.0),
            ),
            contentPadding: const EdgeInsets.symmetric(
              vertical: 15,
              horizontal: 20,
            ),
          ),
        ),
      ],
    );
  }
}
