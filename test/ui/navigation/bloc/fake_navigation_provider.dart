import 'package:flutter/material.dart';
import 'package:weatherforecast/ui/navigation/navigation_provider.dart';

class FakeNavigationProvider extends NavigationProvider {
  String _path = "";

  @override
  void navigateToPath(
    String path,
    GlobalKey<NavigatorState> navigatorKey, {
    RouteSettings? routeSettings,
  }) {
    _path = path;
  }

  String get path => _path;
}
