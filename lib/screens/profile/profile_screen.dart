import 'package:events/core/constants/constants.dart';
import 'package:events/screens/profile/widgets/profile_item_tile.dart';
import 'package:events/screens/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});

  final Widget kHeight = SizedBox(height: 10);
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 60),
              Column(
                children: [
                  SizedBox(width: double.infinity),
                  CircleAvatar(
                    radius: 40,
                    child: Icon(
                      Icons.person,
                      size: 70,
                    ),
                  ),
                  SizedBox(height: 10),
                  CustomText(
                    text: "Name",
                    fontSize: 20,
                    fontweight: FontWeight.bold,
                  ),
                ],
              ),
              SizedBox(height: 30),
              ListView.separated(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) => ProfileItemTile(
                  icon: profileItems[index]["icon"],
                  label: profileItems[index]["label"],
                  onTap: profileItems[index]["onTap"],
                ),
                separatorBuilder: (context, index) => Divider(height: 10),
                itemCount: profileItems.length,
              )
            ],
          ),
        ),
      ),
    );
  }
}
