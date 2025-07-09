
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:weather_task/core/styles/app_colors.dart';

AppBarTheme appBarTheme = AppBarTheme(
  systemOverlayStyle: SystemUiOverlayStyle(
    // Status bar color
    statusBarColor: Colors.red,

    // Status bar brightness (optional)
    statusBarIconBrightness: Brightness.dark, // For Android (dark icons)
    statusBarBrightness: Brightness.light, // For iOS (dark icons)
  ),
  backgroundColor: primaryColor,
  titleTextStyle: TextStyle(color: Colors.white, fontSize: 20),
  iconTheme: IconThemeData(color: Colors.white),
  elevation: 0,
);
