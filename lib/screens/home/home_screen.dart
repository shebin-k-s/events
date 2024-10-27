import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(leading: SvgPicture.asset(assetName),),
      body: Center(
        child: Text("Home screen"),
      ),
    );
  }
}