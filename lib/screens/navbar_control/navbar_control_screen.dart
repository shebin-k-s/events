import 'package:events/screens/home/home_screen.dart';
import 'package:events/screens/navbar_control/widgets/custom_bottom_navbar.dart';
import 'package:events/screens/profile/profile_screen.dart';
import 'package:events/screens/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class NavbarControlScreen extends StatelessWidget {
  NavbarControlScreen({super.key});
  final pages = [
    HomeScreen(),
    HomeScreen(),
    HomeScreen(),
    HomeScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Theme.of(context).colorScheme.background,
      backgroundColor: Colors.white,

      // drawer: CustomAppDrawer(),
      body: SafeArea(
        child: pages[0],
      ),

      bottomNavigationBar: CustomBottomNavigationBar(),
    );
  }
}
