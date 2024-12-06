import 'package:events/screens/explore/explore_screen.dart';
import 'package:events/screens/home/home_screen.dart';
import 'package:events/screens/my_events/my_events_screen.dart';
import 'package:events/screens/navbar_control/widgets/custom_app_drawer.dart';
import 'package:events/screens/navbar_control/widgets/custom_bottom_navbar.dart';
import 'package:events/screens/notification/notification_screen.dart';
import 'package:events/screens/profile/profile_screen.dart';
import 'package:events/screens/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class NavbarControlScreen extends StatelessWidget {
  NavbarControlScreen({super.key});
  final pages = [
    HomeScreen(),
    ExploreScreen(),
    NotificationScreen(),
    MyEventsScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Theme.of(context).colorScheme.background,
      backgroundColor: Colors.white,

      // drawer: CustomAppDrawer(),
      body: SafeArea(
        child: ValueListenableBuilder(
            valueListenable:
                CustomBottomNavigationBar.bottomNavbarIndexNotifier,
            builder: (context, index, _) {
              return pages[index];
            }),
      ),

      bottomNavigationBar: CustomBottomNavigationBar(),
    );
  }
}
