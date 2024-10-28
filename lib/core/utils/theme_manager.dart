import 'package:advanced_ecommerce/core/utils/colors_manager.dart';
import 'package:advanced_ecommerce/core/utils/font_manager.dart';
import 'package:advanced_ecommerce/core/utils/styles_manager.dart';
import 'package:advanced_ecommerce/core/utils/values_manager.dart';
import 'package:flutter/material.dart';

ThemeData getApplicationTheme() {
  return ThemeData(
    // main colors
    primaryColor: ColorsManager.primary,
    primaryColorLight: ColorsManager.lightPrimary,
    primaryColorDark: ColorsManager.darkPrimary,
    disabledColor: ColorsManager.grey1,
    splashColor: ColorsManager.lightPrimary,
    // ripple effect color
    // cardview theme
    cardTheme: CardTheme(
        color: ColorsManager.white,
        shadowColor: ColorsManager.grey,
        elevation: AppSize.s4),
    // app bar theme
    appBarTheme: AppBarTheme(
        centerTitle: true,
        color: ColorsManager.primary,
        elevation: AppSize.s4,
        shadowColor: ColorsManager.lightPrimary,
        titleTextStyle: getRegularStyle(
            fontSize: FontSize.s16, color: ColorsManager.white)),
    // button theme
    buttonTheme: ButtonThemeData(
        shape: const StadiumBorder(),
        disabledColor: ColorsManager.grey1,
        buttonColor: ColorsManager.primary,
        splashColor: ColorsManager.lightPrimary),

    // elevated button them
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
            textStyle: getRegularStyle(
                color: ColorsManager.white, fontSize: FontSize.s17),
            backgroundColor: ColorsManager.primary,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(AppSize.s12)))),

    textTheme: TextTheme(
        displayLarge: getSemiBoldStyle(
            color: ColorsManager.darkGrey, fontSize: FontSize.s16),
        headlineLarge: getSemiBoldStyle(
            color: ColorsManager.darkGrey, fontSize: FontSize.s16),
        headlineMedium: getRegularStyle(
            color: ColorsManager.darkGrey, fontSize: FontSize.s14),
        titleMedium: getMediumStyle(
            color: ColorsManager.primary, fontSize: FontSize.s16),
        titleSmall:
            getRegularStyle(color: ColorsManager.white, fontSize: FontSize.s16),
        bodyLarge: getRegularStyle(color: ColorsManager.grey1),
        bodySmall: getRegularStyle(color: ColorsManager.grey),
        bodyMedium:
            getRegularStyle(color: ColorsManager.grey2, fontSize: FontSize.s12),
        labelSmall:
            getBoldStyle(color: ColorsManager.primary, fontSize: FontSize.s12)),

    // input decoration theme (text form field)
    inputDecorationTheme: InputDecorationTheme(
        // content padding
        contentPadding: const EdgeInsets.all(AppPadding.p8),
        // hint style
        hintStyle:
            getRegularStyle(color: ColorsManager.grey, fontSize: FontSize.s14),
        labelStyle:
            getMediumStyle(color: ColorsManager.grey, fontSize: FontSize.s14),
        errorStyle: getRegularStyle(color: ColorsManager.error),

        // enabled border style
        enabledBorder: OutlineInputBorder(
            borderSide:
                BorderSide(color: ColorsManager.grey, width: AppSize.s1_5),
            borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8))),

        // focused border style
        focusedBorder: OutlineInputBorder(
            borderSide:
                BorderSide(color: ColorsManager.primary, width: AppSize.s1_5),
            borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8))),

        // error border style
        errorBorder: OutlineInputBorder(
            borderSide:
                BorderSide(color: ColorsManager.error, width: AppSize.s1_5),
            borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8))),
        // focused border style
        focusedErrorBorder: OutlineInputBorder(
            borderSide:
                BorderSide(color: ColorsManager.primary, width: AppSize.s1_5),
            borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8)))),
    // label style
  );
}
