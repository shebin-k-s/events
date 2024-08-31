import 'package:events/screens/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 50),
            CustomText(
              text: "Edit profile",
              fontSize: 18,
            ),
          ],
        ),
      ),
    );
  }
}
