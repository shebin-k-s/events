import 'package:events/core/constants/colors.dart';
import 'package:events/screens/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(14.0),
          child: SvgPicture.asset(
            "assets/icons/home/drawer.svg",
          ),
        ),
        title: Row(
          children: [
            Icon(
              Icons.map_rounded,
              color: mainAppThemeColor,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  text: "You are in",
                  fontSize: 12,
                  fontColor: Colors.grey,
                ),
                CustomText(
                  text: "Kochi, Kerala",
                  fontSize: 14,
                  fontColor: Colors.grey,
                ),
              ],
            ),
            Icon(Icons.edit),
            Spacer(),
            SvgPicture.asset("assets/icons/home/chat.svg")
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              TextField(
                decoration: InputDecoration(
                  hintText: "Search for events",
                  prefixIcon: SvgPicture.asset("assets/icons/home/search.svg"),
                  prefixIconConstraints: BoxConstraints.tight(Size(22, 22)),
                  suffixIcon: SvgPicture.asset("assets/icons/home/filter.svg"),
                  suffixIconConstraints: BoxConstraints.tight(Size(22, 22)),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  filled: true,
                  fillColor: Color(0xFFF9FAFB),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
