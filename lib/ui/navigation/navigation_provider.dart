import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:weatherforecast/ui/debug/debug_screen.dart';
import 'package:weatherforecast/ui/main/main_screen.dart';

class NavigationProvider {

  static const DEBUG_ROUTE = '/debug';
  static const HOMEPAGE_ROUTE = '/';

  final router = FluroRouter();

  final _debugScreenHandler = Handler(
      handlerFunc: (BuildContext? context, Map<String, dynamic> params) {
    return const DebugScreen();
  });

  final _mainScreenHandler = Handler(
      handlerFunc: (BuildContext? context, Map<String, dynamic> params) {
        return const MainScreen();
      });

  void defineRoutes() {
    router.define(HOMEPAGE_ROUTE, handler: _mainScreenHandler);
    router.define(DEBUG_ROUTE, handler: _debugScreenHandler);
  }

  void navigateToPath(
    String path,
    GlobalKey<NavigatorState> navigatorKey, {
    RouteSettings? routeSettings,
  }) {
    router.navigateTo(
      navigatorKey.currentState!.context,
      path,
      routeSettings: routeSettings,
      transition: TransitionType.material,
      transitionDuration: const Duration(milliseconds: 300),
    );
  }
}
