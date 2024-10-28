import 'package:advanced_ecommerce/app/app.dart';
import 'package:advanced_ecommerce/app/di.dart';
import 'package:advanced_ecommerce/core/utils/language_manager.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await initAppModule();
  runApp(EasyLocalization(
    supportedLocales: const [ARABIC_LOCAL, ENGLISH_LOCAL],
    path: ASSET_PATH_LOCALISATIONS,
    child: Phoenix(child: MyApp()),
  ));
}
