import 'package:advanced_ecommerce/core/utils/strings_manager.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _HomePageState();
}

class _HomePageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(AppStrings.search.tr()),
    );
  }
}
