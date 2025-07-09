import 'package:flutter/material.dart';
import 'package:weather_task/core/styles/app_colors.dart';
import 'package:weather_task/core/styles/theme/text_theme.dart';
import 'appbar_theme.dart';
import 'icon_theme.dart';


final ThemeData appTheme = ThemeData(
  useMaterial3: true,
  visualDensity: VisualDensity.adaptivePlatformDensity,
  applyElevationOverlayColor: true,
  materialTapTargetSize: MaterialTapTargetSize.padded,
  splashFactory: InkRipple.splashFactory,
  scrollbarTheme: ScrollbarThemeData(
    thumbColor: WidgetStateProperty.all(Colors.white),
  ),
  colorScheme: ColorScheme.fromSeed(
    seedColor: Colors.teal,
    brightness: Brightness.light,
  ),
  scaffoldBackgroundColor: whiteColor,
  dividerColor: Colors.grey.shade400,
  shadowColor: Colors.grey.shade700,
  unselectedWidgetColor: Colors.grey,
  disabledColor: Colors.grey.shade500,
  focusColor: Colors.teal.shade300,
  fontFamily: 'Poppins',
  iconTheme: iconTheme,
  primaryIconTheme: IconThemeData(color: Colors.white),
  textTheme: textTheme,
  appBarTheme: appBarTheme,
  dividerTheme: DividerThemeData(color: borderGreyColor),
);
