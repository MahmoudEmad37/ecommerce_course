import 'package:advanced_ecommerce/app/app_prefs.dart';
import 'package:advanced_ecommerce/app/di.dart';
import 'package:advanced_ecommerce/config/routes/routes.dart';
import 'package:advanced_ecommerce/core/utils/theme_manager.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class MyApp extends StatefulWidget {
  MyApp._internal(); //named constructor

  static final MyApp _instance =
      MyApp._internal(); //singleton or singel instance

  factory MyApp() => _instance; //factory

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final AppPreferences _appPreferences = instance<AppPreferences>();

  @override
  void didChangeDependencies() {
    _appPreferences.getLocal().then((local) => {context.setLocale(local)});
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      debugShowCheckedModeBanner: false,
      onGenerateRoute: RouteGenerator.getRoute,
      initialRoute: Routes.splashRoute,
      theme: getApplicationTheme(),
    );
  }
}
