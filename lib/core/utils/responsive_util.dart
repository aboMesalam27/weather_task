import 'package:flutter/material.dart';

class ResponsiveUtils {
  static double screenWidth(BuildContext context) =>
      MediaQuery.of(context).size.width;
  static double screenHeight(BuildContext context) =>
      MediaQuery.of(context).size.height;

  // Breakpoints
  static bool isMobile(BuildContext context) => screenWidth(context) < 600;
  static bool isTablet(BuildContext context) =>
      screenWidth(context) >= 600 && screenWidth(context) < 1200;
  static bool isDesktop(BuildContext context) => screenWidth(context) >= 1200;

  // Responsive sizing
  static double responsiveFontSize(
    BuildContext context, {
    double mobile = 14,
    double tablet = 16,
    double desktop = 18,
  }) {
    if (isMobile(context)) return mobile;
    if (isTablet(context)) return tablet;
    return desktop;
  }

  static double responsiveWidth(BuildContext context, double percentage) {
    return screenWidth(context) * percentage;
  }

  static double responsiveHeight(BuildContext context, double percentage) {
    return screenHeight(context) * percentage;
  }

  static EdgeInsets responsivePadding(BuildContext context) {
    return EdgeInsets.symmetric(
      horizontal: isMobile(context)
          ? 16
          : isTablet(context)
          ? 32
          : 64,
      vertical: isMobile(context)
          ? 8
          : isTablet(context)
          ? 16
          : 24,
    );
  }
}
