import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:open_sooq/screens/login/login_first_step/login_first_step_screen.dart';
import 'package:open_sooq/screens/main_container/main_container_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:open_sooq/utils/shared_widgets/contact_buttomsheet.dart';
import 'package:open_sooq/utils/shared_widgets/my_appbar.dart';
import 'package:shake/shake.dart';

class MainContainerScreen extends StatefulWidget {
  const MainContainerScreen({Key? key}) : super(key: key);

  @override
  State<MainContainerScreen> createState() => _MainContainerScreenState();
}

class _MainContainerScreenState extends State<MainContainerScreen> {
  final _bloc = MainContainerBloc();
  int activeIndex = 0;
  TabController? controller;

  void changeActivePage(int index) {
    setState(() {
      activeIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();

    ShakeDetector.autoStart(
      onPhoneShake: () async {
        if (isContactButtomSheetIsShown == false) {
          isContactButtomSheetIsShown = true;
          await contactButtomSheet(context).whenComplete(() {
            isContactButtomSheetIsShown = false;
          });
        }
      },
      minimumShakeCount: 1,
      shakeSlopTimeMS: 500,
      shakeCountResetTime: 3000,
      shakeThresholdGravity: 2.7,
    );
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<int>(
        valueListenable: _bloc.currentTabIndexNotifier,
        builder: (context, index, child) {
          return Scaffold(
            appBar: index != 2
                ? myCustomAppBar(
                    context,
                    _bloc.title(index, context),
                  )
                : null,
            body: SafeArea(
              child: IndexedStack(
                index: index,
                children: _bloc.navTabs,
              ),
            ),
            bottomNavigationBar: ConvexAppBar(
              style: TabStyle.fixedCircle,
              controller: controller,
              backgroundColor: Colors.red,
              top: -20,
              height: 55,
              items: [
                TabItem(
                  icon: Icons.home,
                  title: AppLocalizations.of(context)!.bottom_tabbar_home,
                ),
                TabItem(
                  icon: Icons.message,
                  title: AppLocalizations.of(context)!.bottom_tabbar_chat,
                ),
                const TabItem(icon: Icons.add),
                TabItem(
                  icon: Icons.receipt,
                  title: AppLocalizations.of(context)!.bottom_tabbar_mypost,
                ),
                TabItem(
                  icon: Icons.person,
                  title: AppLocalizations.of(context)!.bottom_tabbar_profile,
                ),
              ],
              initialActiveIndex: 0,
              onTap: (int index) {
                _bloc.currentTabIndexNotifier.value = index;
                if (index == 1 || index == 2 || index == 3) {
                  Get.to(() => const LoginFirstStepScreen())?.then((value) {
                    _bloc.currentTabIndexNotifier.value = 0;
                    controller!.index = 0;
                  });
                }
              },
            ),
          );
        });
  }
}
