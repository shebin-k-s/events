import 'package:events/screens/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class DummyScreen extends StatelessWidget {
  const DummyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CustomText(text: "Dummy screen", fontSize: 14),
      ),
    );
  }
}
