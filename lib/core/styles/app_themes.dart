import 'package:added_good/core/styles/app_colors.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AppThemes {

  static ThemeData lightAppTheme = FlexThemeData.light(
    scheme: FlexScheme.bahamaBlue,
    surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffold,
    blendLevel: 9,
    tabBarStyle: FlexTabBarStyle.forBackground,
    subThemesData: const FlexSubThemesData(
      cardElevation: 2,
      blendOnLevel: 10,
      blendOnColors: false,
      defaultRadius: 9.0,
      elevatedButtonRadius: 5.0,
      elevatedButtonSchemeColor: SchemeColor.onPrimary,
      elevatedButtonSecondarySchemeColor: SchemeColor.primary,
      outlinedButtonRadius: 10.0,
      outlinedButtonBorderWidth: 0.5,
      outlinedButtonPressedBorderWidth: 0.5,
      inputDecoratorIsFilled: false,
      inputDecoratorBorderType: FlexInputBorderType.underline,
      inputDecoratorUnfocusedHasBorder: false,
    ),
    visualDensity: FlexColorScheme.comfortablePlatformDensity,
    useMaterial3: true,
    swapLegacyOnMaterial3: true,
    // To use the playground font, add GoogleFonts package and uncomment
    // fontFamily: GoogleFonts.notoSans().fontFamily,
  );

  static ThemeData darkAppTheme = FlexThemeData.dark(
    scheme: FlexScheme.bahamaBlue,
    surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffold,
    blendLevel: 15,
    tabBarStyle: FlexTabBarStyle.forBackground,
    subThemesData: const FlexSubThemesData(
      cardElevation: 2,
      blendOnLevel: 20,
      defaultRadius: 9.0,
      elevatedButtonRadius: 5.0,
      elevatedButtonSchemeColor: SchemeColor.onPrimary,
      elevatedButtonSecondarySchemeColor: SchemeColor.primary,
      outlinedButtonRadius: 10.0,
      outlinedButtonBorderWidth: 0.5,
      outlinedButtonPressedBorderWidth: 0.5,
      inputDecoratorIsFilled: false,
      inputDecoratorBorderType: FlexInputBorderType.underline,
      inputDecoratorUnfocusedHasBorder: false,
    ),
    visualDensity: FlexColorScheme.comfortablePlatformDensity,
    useMaterial3: true,
    swapLegacyOnMaterial3: true,
    // To use the Playground font, add GoogleFonts package and uncomment
    // fontFamily: GoogleFonts.notoSans().fontFamily,
  );



  static final getStorage = GetStorage();
  static final darkThemeKey = "isDarkTheme";

  static void saveThemeData(bool isDarkTheme){
    getStorage.write(darkThemeKey, isDarkTheme);
  }

  static bool isDarkThemeSaved(){
    return getStorage.read(darkThemeKey)?? false;
  }

  static ThemeMode getTheme(){
    return isDarkThemeSaved()? ThemeMode.dark : ThemeMode.light;
  }

  static void changeTheme(){
    Get.changeThemeMode(isDarkThemeSaved()? ThemeMode.light : ThemeMode.dark);
    saveThemeData(!isDarkThemeSaved());
  }

}
