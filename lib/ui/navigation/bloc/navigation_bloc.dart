import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherforecast/data/model/internal/navigation_route.dart';
import 'package:weatherforecast/ui/navigation/bloc/navigation_event.dart';
import 'package:weatherforecast/ui/navigation/bloc/navigation_state.dart';
import 'package:weatherforecast/ui/navigation/navigation_provider.dart';

class NavigationBloc extends Bloc<NavigationEvent, NavigationState> {
  final NavigationProvider _navigationProvider;
  final GlobalKey<NavigatorState> _navigatorKey;

  NavigationBloc(
    this._navigationProvider,
    this._navigatorKey,
  ) : super(const NavigationState(NavigationRoute.debugScreen));

  @override
  Stream<NavigationState> mapEventToState(NavigationEvent event) async* {
    if (event is DebugScreenNavigationEvent) {
      _navigateToPath(NavigationProvider.DEBUG_ROUTE);
      yield const NavigationState(NavigationRoute.debugScreen);
    }
  }

  void _navigateToPath(String path, {RouteSettings? routeSettings}) {
    _navigationProvider.navigateToPath(
      path,
      _navigatorKey,
      routeSettings: routeSettings,
    );
  }
}
