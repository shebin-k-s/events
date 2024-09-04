import 'package:events/core/constants/constants.dart';
import 'package:events/screens/profile/widgets/profile_item_tile.dart';
import 'package:events/screens/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});

  final Widget kHeight = const SizedBox(height: 10);

  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 60),
              Column(
                children: [
                  const SizedBox(width: double.infinity),
                  const CircleAvatar(
                    radius: 40,
                    child: Icon(
                      Icons.person,
                      size: 70,
                    ),
                  ),
                  const SizedBox(height: 10),
                  CustomText(
                    text: "Name",
                    fontSize: 20,
                    fontweight: FontWeight.bold,
                  ),
                ],
              ),
              const SizedBox(height: 30),
              ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) => ProfileItemTile(
                  icon: profileItems[index]["icon"],
                  label: profileItems[index]["label"],
                  // onTap: profileItems[index]["onTap"],
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => profileItems[index]["goTo"]));
                  },
                ),
                separatorBuilder: (context, index) => const Divider(height: 10),
                itemCount: profileItems.length,
              )
            ],
          ),
        ),
      ),
    );
  }
}
