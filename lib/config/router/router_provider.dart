import 'package:energise_test/config/router/routes_name.dart';
import 'package:energise_test/presentation/pages/location_page.dart';
import 'package:energise_test/presentation/pages/native_buttons_page.dart';
import 'package:energise_test/presentation/pages/stopwatch_page.dart';
import 'package:energise_test/presentation/widgets/bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class RouterProvider {
  static final _rootNavigatorKey = GlobalKey<NavigatorState>();
  static final GoRouter router = GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: RoutesName.stopWatch,
    routes: [
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return Scaffold(
            body: navigationShell,
            bottomNavigationBar: BottomNavigation(
              navigationShell: navigationShell,
            ),
          );
        },
        branches: [
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: RoutesName.stopWatch,
                builder: (context, state) => const StopwatchPage(),
              ),
            ],
          ),
          StatefulShellBranch(routes: [
            GoRoute(
              path: RoutesName.location,
              builder: (context, state) => const LocationPage(),
            )
          ]),
          StatefulShellBranch(routes: [
            GoRoute(
              path: RoutesName.buttons,
              builder: (context, state) => NativeButtonsPage(),
            )
          ]),
        ],
      ),
    ],
  );
}
