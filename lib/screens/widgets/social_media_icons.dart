
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SocialMediaIcons extends StatelessWidget {
  const SocialMediaIcons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(top:8.0),
          child: IconButton(
            icon: SvgPicture.asset(
              'assets/images/google.svg',
              height: 40,
              width: 40,
            ),
            onPressed: () {},
          ),
        ),
        IconButton(
          icon: SvgPicture.asset(
            'assets/images/apple.svg',
            height: 45,
            width: 45,
          ),
          onPressed: () {},
        ),
      ],
    );
  }
}
