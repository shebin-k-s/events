import 'package:events/application/profile/profile_bloc.dart';
import 'package:events/core/constants/constants.dart';
import 'package:events/screens/profile/widgets/profile_item_tile.dart';
import 'package:events/screens/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});


  final ProfileBloc _profileBloc = ProfileBloc();

  final Widget kHeight = const SizedBox(height: 10);

  @override
  Widget build(BuildContext context) {
    // _profileBloc.add(FetchProfileInfoEvent());
    context.read<ProfileBloc>().add(FetchProfileInfoEvent());
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
                  BlocBuilder<ProfileBloc, ProfileState>(
                    buildWhen: (previous, current) =>
                        current is FetchProfileSuccessState,
                    builder: (context, state) {
                      if (state is FetchProfileSuccessState) {
                        print("object..........");
                        return CustomText(
                          text: state.profileDataModel.firstName,
                          fontSize: 20,
                          fontweight: FontWeight.bold,
                        );
                      } else {
                        return LoadingAnimationWidget.prograssiveDots(
                          color: Colors.purple,
                          size: 40

                        );
                      }
                    },
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
