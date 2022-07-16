import 'package:flutter/material.dart';
import 'package:open_sooq/screens/profile/profile_bloc.dart';
import 'package:open_sooq/screens/profile/widgets/follow_us_view.dart';
import 'package:open_sooq/screens/profile/widgets/option_view.dart';
import 'package:open_sooq/screens/profile/widgets/profile_header_view.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({Key? key}) : super(key: key);

  var bloc = ProfileBloc();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black12,
      child: SingleChildScrollView(
        child: Column(
          children: [
            const ProfileHeaderView(),
            OptionView(list: bloc.list1),
            OptionView(list: bloc.list2),
            OptionView(list: bloc.list3),
            const FollowUsView(),
          ],
        ),
      ),
    );
  }
}
