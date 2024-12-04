import 'package:events/screens/navbar_control/widgets/app_drawer_item.dart';
import 'package:events/screens/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class CustomAppDrawer extends StatelessWidget {
  CustomAppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    // bottomNavbarIndexNotifier.value = 0;
    return Drawer(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 20),
              Row(
                children: [
                  CircleAvatar(
                    radius: 30,
                  ),
                  SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [],
                  )
                ],
              ),
              SizedBox(height: 30),
              // Divider(
              //   thickness: 0.5,
              //   color: Colors.grey,
              //   height: 0,
              // ),
              AppDrawerItem(
                icon: Icons.menu,
                label: "item",
                onTap: () {},
              ),
              AppDrawerItem(
                icon: Icons.shopping_bag,
                label: "item",
                onTap: () {},
              ),
              AppDrawerItem(
                icon: Icons.favorite_outline,
                label: "item",
                onTap: () {},
              ),
              AppDrawerItem(
                icon: Icons.reviews,
                label: "item",
                onTap: () {},
              ),
              AppDrawerItem(
                icon: Icons.call,
                label: "item",
                onTap: () {},
              ),
              AppDrawerItem(
                icon: Icons.fast_rewind_rounded,
                label: "item",
                onTap: () {},
              ),
              AppDrawerItem(
                icon: Icons.person,
                label: "item",
                onTap: () {},
              ),
              AppDrawerItem(
                icon: Icons.settings,
                label: "item",
                onTap: () {},
              ),
              Divider(
                thickness: 0.5,
                color: Colors.grey,
                height: 0,
              ),
              AppDrawerItem(
                icon: Icons.logout,
                label: "item",
                onTap: () {},
              ),
              // SizedBox(height: 50.w)
            ],
          ),
        ),
      ),
    );
  }
}
