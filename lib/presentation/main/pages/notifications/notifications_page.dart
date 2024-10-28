import 'package:advanced_ecommerce/core/utils/strings_manager.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class NotificationsPage extends StatefulWidget {
  const NotificationsPage({Key? key}) : super(key: key);

  @override
  State<NotificationsPage> createState() => _HomePageState();
}

class _HomePageState extends State<NotificationsPage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(AppStrings.notifications.tr()),
    );
  }
}
