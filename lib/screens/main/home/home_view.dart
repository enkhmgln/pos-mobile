import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '/components/_.dart';

import 'favorites/_.dart';
import 'home_controller.dart';
import 'keypad/_.dart';
import 'library/_.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  static const String routeName = '/home';

  static const _tabLabels = ['Keypad', 'Library', 'Favorites'];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      bottom: false,
      child: DefaultTabController(
        length: _tabLabels.length,
        initialIndex: 0,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 12, 20, 0),
              child: AppTabBar(tabs: _tabLabels),
            ),
            Expanded(
              child: TabBarView(
                children: [
                  KeypadTabContent(controller: controller),
                  const LibraryTabContent(),
                  const FavoritesTabContent(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
