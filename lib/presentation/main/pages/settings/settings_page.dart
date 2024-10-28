import 'package:advanced_ecommerce/app/app_prefs.dart';
import 'package:advanced_ecommerce/app/di.dart';
import 'package:advanced_ecommerce/config/routes/routes.dart';
import 'package:advanced_ecommerce/core/utils/assets_manager.dart';
import 'package:advanced_ecommerce/core/utils/language_manager.dart';
import 'package:advanced_ecommerce/core/utils/strings_manager.dart';
import 'package:advanced_ecommerce/core/utils/values_manager.dart';
import 'package:advanced_ecommerce/data/data_source/local_data_source.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'dart:math' as math;

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  State<SettingsPage> createState() => _HomePageState();
}

class _HomePageState extends State<SettingsPage> {
  final AppPreferences _appPreferences = instance<AppPreferences>();
  final LocalDataSource _localDataSource = instance<LocalDataSource>();
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListView(
        padding: const EdgeInsets.all(AppPadding.p8),
        children: [
          ListTile(
            leading: SvgPicture.asset(ImageAssets.changeLangIc),
            title: Text(AppStrings.changeLanguage.tr(),
                style: Theme.of(context).textTheme.bodyLarge),
            trailing: Transform(
              alignment: Alignment.center,
              transform: Matrix4.rotationY(isRtl() ? math.pi : 0),
              child: SvgPicture.asset(ImageAssets.rightArrowIc),
            ),
            onTap: () {
              _changeLamnguage();
            },
          ),
          ListTile(
            leading: SvgPicture.asset(ImageAssets.contactUsIc),
            title: Text(AppStrings.contactUs.tr(),
                style: Theme.of(context).textTheme.bodyLarge),
            trailing: Transform(
                alignment: Alignment.center,
                transform: Matrix4.rotationY(isRtl() ? math.pi : 0),
                child: SvgPicture.asset(ImageAssets.rightArrowIc)),
            onTap: () {
              _contactUs();
            },
          ),
          ListTile(
            leading: SvgPicture.asset(ImageAssets.inviteFriendsIc),
            title: Text(AppStrings.inviteYourFriends.tr(),
                style: Theme.of(context).textTheme.bodyLarge),
            trailing: Transform(
                alignment: Alignment.center,
                transform: Matrix4.rotationY(isRtl() ? math.pi : 0),
                child: SvgPicture.asset(ImageAssets.rightArrowIc)),
            onTap: () {
              _inviteFriends();
            },
          ),
          ListTile(
            leading: SvgPicture.asset(ImageAssets.logoutIc),
            title: Text(AppStrings.logout.tr(),
                style: Theme.of(context).textTheme.bodyLarge),
            trailing: Transform(
                alignment: Alignment.center,
                transform: Matrix4.rotationY(isRtl() ? math.pi : 0),
                child: SvgPicture.asset(ImageAssets.rightArrowIc)),
            onTap: () {
              _logout();
            },
          ),
        ],
      ),
    );
  }

  bool isRtl() {
    return context.locale == ARABIC_LOCAL;
  }

  _changeLamnguage() {
    _appPreferences.changeAppLanguage();
    Phoenix.rebirth(context);
  }

  _contactUs() {}

  _inviteFriends() {}

  _logout() {
    _appPreferences.logout();
    _localDataSource.clearCache();
    Navigator.pushReplacementNamed(context, Routes.loginRoute);
  }
}
