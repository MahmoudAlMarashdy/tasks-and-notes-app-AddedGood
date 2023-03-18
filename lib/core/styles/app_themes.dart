import 'package:added_good/core/styles/app_colors.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AppThemes {

  ThemeData lightAppTheme = ThemeData.light().copyWith(
    textTheme: TextTheme(
      bodyLarge: TextStyle(color: AppColors.flexSchemeLight.secondary,fontSize: 25),
      bodyMedium: TextStyle(color: AppColors.flexSchemeLight.secondary,fontSize: 18)
    ),
    colorScheme: AppColors.flexSchemeLight,
    scaffoldBackgroundColor: AppColors.lightBG,
    drawerTheme: DrawerThemeData(
      backgroundColor: AppColors.lightBG,
    ),
    appBarTheme: AppBarTheme(
      foregroundColor: AppColors.flexSchemeLight.secondary,
      titleTextStyle: TextStyle(color: AppColors.flexSchemeLight.secondary,fontSize: 22),
      backgroundColor: AppColors.lightBG,
      elevation: 0
    ),
    tabBarTheme: TabBarTheme(
      labelColor: AppColors.flexSchemeLight.secondary,
      unselectedLabelColor: AppColors.flexSchemeLight.secondary.withOpacity(0.4),
    ),
    cardTheme: CardTheme(
      color: AppColors.lightBG,
      elevation: 0,
      shape: RoundedRectangleBorder(
        side: BorderSide(color:AppColors.flexSchemeLight.secondary,width: 1),
        borderRadius: BorderRadius.circular(10)
      )
    ),
    checkboxTheme: CheckboxThemeData(
      //fillColor: MaterialStateProperty.all(AppColors.primary),
      side: BorderSide(width: 0.5),
      shape: RoundedRectangleBorder(
        side: BorderSide(color: AppColors.flexSchemeLight.primary)
      )
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        //backgroundColor: MaterialStateProperty.all(AppColors.primary),
      )
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
        style: ButtonStyle(
            //foregroundColor: MaterialStateProperty.all(AppColors.primary)
        )
    ),
    bottomSheetTheme: BottomSheetThemeData(
      //backgroundColor: AppColors.lightBG
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      //backgroundColor: AppColors.primary,
      //foregroundColor: Colors.white,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    ),
  );

  ThemeData darkAppTheme = ThemeData.dark().copyWith(
    colorScheme: AppColors.flexSchemeDark,
    scaffoldBackgroundColor: AppColors.darkBG,
    drawerTheme: DrawerThemeData(
      backgroundColor: AppColors.darkBG,
    ),
    appBarTheme: AppBarTheme(
        foregroundColor: AppColors.primary,
        titleTextStyle: TextStyle(color: AppColors.primary,fontSize: 22),
        backgroundColor: AppColors.darkBG,
        elevation: 0
    ),
    tabBarTheme: TabBarTheme(
      labelColor: AppColors.primary,
      labelStyle: TextStyle(fontSize: 18),
      unselectedLabelColor: AppColors.primary.withOpacity(0.4),
      unselectedLabelStyle: TextStyle(fontSize: 18),
    ),
    cardTheme: CardTheme(
      color: AppColors.darkBG,
      elevation: 0,
      shape: RoundedRectangleBorder(
          side: BorderSide(color: AppColors.primary,width: 0.5),
          borderRadius: BorderRadius.circular(10)
      )
    ),
    checkboxTheme: CheckboxThemeData(
      fillColor: MaterialStateProperty.all(AppColors.primary),
      side: BorderSide(width: 0.5,color: AppColors.primary)
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(AppColors.primary),
        )
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: ButtonStyle(
        foregroundColor: MaterialStateProperty.all(AppColors.primary)
      )
    ),
    bottomSheetTheme: BottomSheetThemeData(
        backgroundColor: AppColors.darkBG
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: AppColors.primary,
      foregroundColor: Colors.white,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    ),
  );

  final getStorage = GetStorage();
  final darkThemeKey = "isDarkTheme";

  void saveThemeData(bool isDarkTheme){
    getStorage.write(darkThemeKey, isDarkTheme);
  }

  bool isDarkThemeSaved(){
    return getStorage.read(darkThemeKey)?? false;
  }

  ThemeMode getTheme(){
    return isDarkThemeSaved()? ThemeMode.dark : ThemeMode.light;
  }

  void changeTheme(){
    Get.changeThemeMode(isDarkThemeSaved()? ThemeMode.light : ThemeMode.dark);
    saveThemeData(!isDarkThemeSaved());
  }

}
