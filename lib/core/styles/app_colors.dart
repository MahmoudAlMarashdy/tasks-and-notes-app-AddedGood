import 'package:flutter/material.dart';

class AppColors {

  static Color primary = const Color(0xff7E7E7E);
  static Color lightBG = const Color(0xffFFFFFF);
  static Color darkBG = const Color(0xff1E1E1E);

  static const ColorScheme flexSchemeLight = ColorScheme(
    brightness: Brightness.light,
    primary: Color(0xff1a2c42),
    onPrimary: Color(0xffffffff),
    primaryContainer: Color(0xffb1c0dd),
    onPrimaryContainer: Color(0xff0f1012),
    secondary: Color(0xff1a2c42),
    onSecondary: Color(0xffffffff),
    secondaryContainer: Color(0xffe0bd80),
    onSecondaryContainer: Color(0xff13100b),
    tertiary: Color(0xfff0b03f),
    onTertiary: Color(0xff000000),
    tertiaryContainer: Color(0xffe9cfa1),
    onTertiaryContainer: Color(0xff13110e),
    error: Color(0xffb00020),
    onError: Color(0xffffffff),
    errorContainer: Color(0xfffcd8df),
    onErrorContainer: Color(0xff141213),
    background: Color(0xfff6f7f8),
    onBackground: Color(0xff090909),
    surface: Color(0xfff6f7f8),
    onSurface: Color(0xff090909),
    surfaceVariant: Color(0xffeef0f1),
    onSurfaceVariant: Color(0xff121212),
    outline: Color(0xff565656),
    shadow: Color(0xff000000),
    inverseSurface: Color(0xff111112),
    onInverseSurface: Color(0xfff5f5f5),
    inversePrimary: Color(0xff9eacbd),
    surfaceTint: Color(0xff1a2c42),
  );


  static const ColorScheme flexSchemeDark = ColorScheme(
    brightness: Brightness.dark,
    primary: Color(0xff60748a),
    onPrimary: Color(0xfff6f8f9),
    primaryContainer: Color(0xff1a2c42),
    onPrimaryContainer: Color(0xffe3e6ea),
    secondary: Color(0xffebb251),
    onSecondary: Color(0xff14110a),
    secondaryContainer: Color(0xffd48608),
    onSecondaryContainer: Color(0xfffff4e1),
    tertiary: Color(0xfff4ca7e),
    onTertiary: Color(0xff14130d),
    tertiaryContainer: Color(0xffc68e2d),
    onTertiaryContainer: Color(0xfffef6e6),
    error: Color(0xffcf6679),
    onError: Color(0xff140c0d),
    errorContainer: Color(0xffb1384e),
    onErrorContainer: Color(0xfffbe8ec),
    background: Color(0xff151618),
    onBackground: Color(0xffececec),
    surface: Color(0xff151618),
    onSurface: Color(0xffececec),
    surfaceVariant: Color(0xff1a1c1f),
    onSurfaceVariant: Color(0xffdbdbdb),
    outline: Color(0xffa0a0a0),
    shadow: Color(0xff000000),
    inverseSurface: Color(0xfff5f6f8),
    onInverseSurface: Color(0xff131313),
    inversePrimary: Color(0xff38404a),
    surfaceTint: Color(0xff60748a),
  );


}