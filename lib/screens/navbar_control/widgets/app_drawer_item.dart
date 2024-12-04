import 'package:events/screens/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class AppDrawerItem extends StatelessWidget {
  const AppDrawerItem({super.key, required this.icon, required this.label, required this.onTap});

  final IconData icon;
  final String label;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      enableFeedback: false,
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 15),
        child: Row(
          children: [
            Icon(icon),
            SizedBox(width: 10),
            CustomText(text: label, fontSize: 14,),
          ],
        ),
      ),
    );
  }
}
