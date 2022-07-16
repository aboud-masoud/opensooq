import 'package:flutter/material.dart';
import 'package:open_sooq/screens/home/home_bloc.dart';
import 'package:open_sooq/screens/home/widgets/banner_view.dart';
import 'package:open_sooq/screens/home/widgets/category_view.dart';
import 'package:open_sooq/screens/home/widgets/favorite.dart';
import 'package:open_sooq/screens/home/widgets/tutorials_banner.dart';
import 'package:open_sooq/utils/shared_widgets/admob_banner.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  final _bloc = HomeBloc();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const HomeBannerView(),
          HomeCategoryView(listOfCategories: _bloc.listOfCategories),
          const TutorialsBannerHomePage(),
          const SizedBox(height: 8),
          const AddMobBanner(),
          const SizedBox(height: 8),
          FavoriteHomePage(listOfFavorite: _bloc.listFavoriteItems),
          const SizedBox(height: 8),
          const AddMobBanner(),
          const SizedBox(height: 8),
        ],
      ),
    );
  }
}
