import 'package:advanced_ecommerce/core/utils/colors_manager.dart';
import 'package:advanced_ecommerce/core/utils/strings_manager.dart';
import 'package:advanced_ecommerce/core/utils/values_manager.dart';
import 'package:advanced_ecommerce/presentation/main/pages/home/view/home_page.dart';
import 'package:advanced_ecommerce/presentation/main/pages/notifications/notifications_page.dart';
import 'package:advanced_ecommerce/presentation/main/pages/search/search_page.dart';
import 'package:advanced_ecommerce/presentation/main/pages/settings/settings_page.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class MainView extends StatefulWidget {
  const MainView({Key? key}) : super(key: key);

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  List<Widget> pages = [
    HomePage(),
    SearchPage(),
    NotificationsPage(),
    SettingsPage(),
  ];

  List<String> titles = [
    AppStrings.home,
    AppStrings.search,
    AppStrings.notifications,
    AppStrings.settings,
  ];

  var _title = AppStrings.home;
  var _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          _title,
          style: Theme.of(context).textTheme.titleSmall,
        ),
      ),
      body: pages[_currentIndex],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(color: ColorsManager.black, spreadRadius: AppSize.s1_5),
        ]),
        child: BottomNavigationBar(
          selectedItemColor: ColorsManager.primary,
          unselectedItemColor: ColorsManager.grey,
          currentIndex: _currentIndex,
          //TODO:
          //onTap: (){},
          items: [
            BottomNavigationBarItem(
                icon: const Icon(Icons.home_outlined),
                label: AppStrings.home.tr()),
            BottomNavigationBarItem(
                icon: const Icon(Icons.search), label: AppStrings.search.tr()),
            BottomNavigationBarItem(
                icon: const Icon(Icons.notifications),
                label: AppStrings.notifications.tr()),
            BottomNavigationBarItem(
                icon: const Icon(Icons.settings),
                label: AppStrings.settings.tr()),
          ],
        ),
      ),
    );
  }

  onTap(int index) {
    setState(() {
      _currentIndex = index;
      _title = titles[_currentIndex];
    });
  }
}
