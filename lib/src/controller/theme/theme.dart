import 'package:flutter/material.dart';
import '../../view/utils/color_manager.dart';
import '../../view/utils/font_manager.dart';
import '../../view/utils/size_manager.dart';
import '../../view/utils/style_text.dart';

ThemeData getApplicationTheme(){
  return ThemeData(
    // main color
    primaryColor: ColorManager.blueDark,
    primaryColorLight: ColorManager.blue,
    primaryColorDark: ColorManager.blueDark,
    splashColor: ColorManager.blue,
    disabledColor: ColorManager.grey,
    cardTheme:  CardTheme(
      color: ColorManager.grey.withOpacity(0.5),
      margin: const EdgeInsets.all(AppMargin.m8),
      shadowColor: ColorManager.grey,
      elevation: AppSize.z4,
    ),
    appBarTheme: AppBarTheme(
      centerTitle: true,
      color: ColorManager.blueDark,
      elevation: AppSize.z4,
      shadowColor: ColorManager.blue,
      titleTextStyle: getRegularStyle(color: ColorManager.grey,fontSize: FontSize.s16,),
    ),
    buttonTheme:  const ButtonThemeData(
      // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppSize.z10)),
      shape: StadiumBorder(),
      disabledColor: ColorManager.grey,
      buttonColor: ColorManager.blueDark,
      splashColor: ColorManager.blue,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        textStyle: getRegularStyle(color: ColorManager.grey,fontSize: FontSize.s18),
        backgroundColor: ColorManager.blueDark,
        // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppSize.z12)),
        shape:  StadiumBorder(),
      ),
    ),
    textTheme: TextTheme(
      headlineLarge: getSemiBoldStyle(color: ColorManager.brown,fontSize: FontSize.s16),
      headlineMedium: getRegularStyle(color: ColorManager.brown,fontSize: FontSize.s14),
      titleMedium: getMediumStyle(color: ColorManager.blueDark,fontSize: FontSize.s16),
      titleLarge: getBoldStyle(color: ColorManager.blueDark , fontSize: FontSize.s20),
      bodyLarge: getRegularStyle(color: ColorManager.grey,),
      bodySmall: getRegularStyle(color: ColorManager.grey),
      displayLarge: getLightStyle(color: ColorManager.blueDark , fontSize: FontSize.s22,fontWeight: FontWeighManager.medium),
    ),
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: const EdgeInsets.all(AppPadding.p8),
      hintStyle: getRegularStyle(color: ColorManager.blueDark,fontSize: FontSize.s14),
      labelStyle: getMediumStyle(color: ColorManager.grey,fontSize: FontSize.s14),
      errorStyle: getRegularStyle(color: ColorManager.red,fontSize: FontSize.s14),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppSize.z8),
        borderSide: const BorderSide(color: ColorManager.grey , width: AppSize.z1_5),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppSize.z8),
        borderSide: const BorderSide(color: ColorManager.blueDark , width: AppSize.z1_5),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppSize.z8),
        borderSide: const BorderSide(color: ColorManager.red , width: AppSize.z1_5),
      ),
    ),
  );
}