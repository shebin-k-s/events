import 'package:events/screens/edit_profile/edit_profile_screen.dart';
import 'package:flutter/material.dart';

const kTextFieldHeight = SizedBox(height: 20);



 final List<Map> profileItems = [
      {
        "icon": Icons.edit,
        "label": "Edit profile",
        "goTo": EditProfileScreen()
      },
      {
        "icon": Icons.history,
        "label": "Events booking history",
        "onTap": () {},
      },
      {
        "icon": Icons.live_tv,
        "label": "Live events booking history",
        "onTap": () {}
      },
      {
        "icon": Icons.cancel,
        "label": "Canceled events history",
        "onTap": () {},
      },
      {
        "icon": Icons.post_add,
        "label": "User highlights post",
        "onTap": () {},
      },
      {
        "icon": Icons.group,
        "label": "Added friends details",
        "onTap": () {},
      },
    ];
