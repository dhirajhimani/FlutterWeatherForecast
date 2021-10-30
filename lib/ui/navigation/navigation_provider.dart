import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:weatherforecast/ui/debug/debug_screen.dart';

class NavigationProvider {

  static const DEBUG_ROUTE = '/debug';

  final router = FluroRouter();

  final _debugScreenHandler = Handler(
      handlerFunc: (BuildContext? context, Map<String, dynamic> params) {
    return const DebugScreen();
  });

  void defineRoutes() {
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
