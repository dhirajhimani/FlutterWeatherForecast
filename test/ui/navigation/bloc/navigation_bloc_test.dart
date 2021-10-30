import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:weatherforecast/data/model/internal/navigation_route.dart';
import 'package:weatherforecast/ui/navigation/bloc/navigation_bloc.dart';
import 'package:weatherforecast/ui/navigation/bloc/navigation_event.dart';
import 'package:weatherforecast/ui/navigation/bloc/navigation_state.dart';

import 'fake_navigation_provider.dart';

void main() {
  late FakeNavigationProvider fakeNavigationProvider;
  late NavigationBloc navigationBloc;

  setUp(() {
    fakeNavigationProvider = FakeNavigationProvider();
    navigationBloc =
        buildNavigationBloc(fakeNavigationProvider: fakeNavigationProvider);
  });

  test("Should navigate to Debug screen", () async {
    navigationBloc.add(DebugScreenNavigationEvent());

    await expectLater(
      navigationBloc.stream,
      emitsInOrder(
        <NavigationState>[const NavigationState(NavigationRoute.debugScreen)],
      ),
    );

    expect(fakeNavigationProvider.path, "/debug");
  });
}

NavigationBloc buildNavigationBloc(
        {FakeNavigationProvider? fakeNavigationProvider}) =>
    NavigationBloc(
      fakeNavigationProvider ?? FakeNavigationProvider(),
      GlobalKey(),
    );
