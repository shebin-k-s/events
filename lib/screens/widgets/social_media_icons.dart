import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:events/screens/authentication/auth_webview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SocialMediaIcons extends StatelessWidget {
  const SocialMediaIcons({
    super.key,
  });

  final String authUrl =
      "https://accounts.google.com/o/oauth2/auth/oauthchooseaccount?client_id=528873077264-a5ko0c38e8c9c0k6ukfa75ilnqdeo4iq.apps.googleusercontent.com&response_type=code&redirect_uri=http%3A%2F%2Flocalhost%2Fevents%2Fcustomer%2Fauth&xoauth_displayname=My%20Application&scope=https%3A%2F%2Fwww.googleapis.com%2Fauth%2Fuserinfo.profile%20https%3A%2F%2Fwww.googleapis.com%2Fauth%2Fuserinfo.email&state=32d7601be436785e858a1420b968f392d88162266ac1ca0b9cbf03650aff988b&service=lso&o2v=1&ddm=0&flowName=GeneralOAuthFlow";

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
              onPressed: () => _handleGoogleSignIn(context)),
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

  void _handleGoogleSignIn(BuildContext context) {
    print("Trying google signin");
    showDialog(
      context: context,
      builder: (context) => GoogleAuthWebView(
        authUrl: authUrl,
        onAuthSuccess: (String url) {
          // Handle successful authentication
          print('Success URL: $url');
          // Extract tokens or other data from URL
          Navigator.of(context).pop(); // Close the WebView
          // Navigate to your app's home screen or perform other actions
        },
        onAuthError: (String url) {
          // Handle authentication error
          print('Error URL: $url');
          Navigator.of(context).pop(); // Close the WebView
          // Show error message to user
        },
      ),
    );
  }
}
