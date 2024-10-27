import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:events/screens/authentication/auth_webview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_sign_in/google_sign_in.dart';

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
          padding: const EdgeInsets.only(top: 8.0),
          child: IconButton(
              icon: SvgPicture.asset(
                'assets/images/google.svg',
                height: 40,
                width: 40,
              ),
              onPressed: () => _handleGoogleSignIn()),
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

  void _handleGoogleSignIn() async {
    try {
      final _googleSignin = GoogleSignIn();
      GoogleSignInAccount? _user = await _googleSignin.signIn();
      print(_user?.displayName);
      print(_user?.email);
    } catch (e) {
      print(e);
    }
  }
}
