import 'package:flutter/material.dart';
import 'package:open_sooq/models/profile_option_model.dart';

class ProfileBloc {
  List<ProfileOption> list1 = [
    ProfileOption(
      title: 'Sales Team',
      backgroundColor: Colors.grey,
      icon: Icons.person,
      callback: () {
        print("sales");
      },
    )
  ];

  List<ProfileOption> list2 = [
    ProfileOption(
      title: 'Create Shop Now',
      backgroundColor: Colors.blue,
      icon: Icons.shop,
      callback: () {
        print('Create Shop Now');
      },
    ),
    ProfileOption(
      title: 'Account Details',
      backgroundColor: Colors.blue,
      icon: Icons.king_bed,
      callback: () {
        print('Account Details');
      },
    ),
    ProfileOption(
      title: 'ID & C.... etc',
      backgroundColor: Colors.blue,
      icon: Icons.king_bed,
      callback: () {
        print(' --- ');
      },
    )
  ];

  List<ProfileOption> list3 = [
    ProfileOption(
      title: 'Wallet',
      backgroundColor: Colors.green,
      icon: Icons.wallet,
      callback: () {
        print(' --- ');
      },
    ),
    ProfileOption(
      title: 'Add Credit',
      backgroundColor: Colors.green,
      icon: Icons.add,
      callback: () {
        print(' --- ');
      },
    ),
    ProfileOption(
      title: 'Recharge Card',
      backgroundColor: Colors.green,
      icon: Icons.card_giftcard,
      callback: () {
        print(' --- ');
      },
    ),
    ProfileOption(
      title: 'Buy Bundles',
      backgroundColor: Colors.green,
      icon: Icons.brunch_dining_outlined,
      callback: () {
        print(' --- ');
      },
    ),
  ];
}
