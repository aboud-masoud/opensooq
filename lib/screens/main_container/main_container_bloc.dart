import 'package:flutter/widgets.dart';
import 'package:open_sooq/screens/add_post/add_post_screen.dart';
import 'package:open_sooq/screens/chat/chat_screen.dart';
import 'package:open_sooq/screens/home/home_screen.dart';
import 'package:open_sooq/screens/my_post/my_post_screen.dart';
import 'package:open_sooq/screens/profile/profile_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MainContainerBloc {
  final ValueNotifier<int> currentTabIndexNotifier = ValueNotifier<int>(0);

  List<Widget> navTabs = [
    HomeScreen(),
    const ChatScreen(),
    const AddPostScreen(),
    const MyPostScreen(),
    ProfileScreen()
  ];

  String title(int index, context) {
    switch (index) {
      case 0:
        return AppLocalizations.of(context)!.bottom_tabbar_home;
      case 1:
        return AppLocalizations.of(context)!.bottom_tabbar_chat;

      case 3:
        return AppLocalizations.of(context)!.bottom_tabbar_mypost;
      case 4:
        return AppLocalizations.of(context)!.bottom_tabbar_profile;
      default:
        return "";
    }
  }
}
