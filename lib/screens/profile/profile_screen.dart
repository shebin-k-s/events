import 'package:events/application/profile/profile_bloc.dart';
import 'package:events/core/constants/constants.dart';
import 'package:events/screens/edit_profile/edit_profile_screen.dart';
import 'package:events/screens/profile/widgets/profile_item_tile.dart';
import 'package:events/screens/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});

  final ProfileBloc _profileBloc = ProfileBloc();

  final Widget kHeight = SizedBox(height: 10);

  @override
  Widget build(BuildContext context) {
    _profileBloc.add(FetchProfileInfoEvent());
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
                  BlocBuilder<ProfileBloc, ProfileState>(
                    buildWhen: (previous, current) =>
                        current is FetchProfileSuccessState,
                    builder: (context, state) {
                      if (state is FetchProfileSuccessState)
                        return CustomText(
                          text: state.profileDataModel.firstName,
                          fontSize: 20,
                          fontweight: FontWeight.bold,
                        );
                      else
                        return SizedBox();
                    },
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
                  // onTap: profileItems[index]["onTap"],
                  onTap: () {
                    // Navigator.of(context).push(MaterialPageRoute(
                    //     builder: (context) => profileItems[index]["goTo"]));
                  },
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
