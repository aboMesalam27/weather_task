import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:weather_task/core/routes/route_paths.dart';
import 'package:weather_task/features/splash/splash_screen.dart';
import '../../features/weather/view/pages/weather_screen.dart';
/// [router] => Go Router Instance
final router = GoRouter(
  initialLocation: RoutePaths.splash,
  debugLogDiagnostics: false,
  routes: [
    fadeRoute(
      path: RoutePaths.splash,
      name: RoutePaths.splash,
      builder: (context, state) => SplashScreen(),
    ),
    fadeRoute(
      path: RoutePaths.weather,
      name: RoutePaths.weather,
      builder: (context, state) => WeatherScreen(),
    ),
  ],
);

/// [fadeRoute] => Fade Transition Route
GoRoute fadeRoute({
  required String path,
  required String name,
  required Widget Function(BuildContext, GoRouterState) builder,
}) {
  return GoRoute(
    path: path,
    name: name,
    pageBuilder: (context, state) {
      return CustomTransitionPage(
        key: state.pageKey,
        child: builder(context, state),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return FadeTransition(opacity: animation, child: child);
        },
      );
    },
  );
}
