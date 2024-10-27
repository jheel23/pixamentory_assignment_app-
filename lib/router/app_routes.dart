import 'package:flutter/material.dart';
import 'package:games_hub/screens/main_tab_screen.dart';
import 'package:games_hub/screens/tabs/home_screen.dart';
import 'package:games_hub/screens/tabs/webview_screen.dart';
import 'package:go_router/go_router.dart';

class AppRoutes {
  AppRoutes._();
  static AppRoutes instance = AppRoutes._();
  static final _rootNavigatorKey = GlobalKey<NavigatorState>();
  static const homeScreen = '/home-screen';
  static const webviewScreen = '/webview-screen';
  final GoRouter router = GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: '/home-screen',
    routes: [
      StatefulShellRoute.indexedStack(
          builder: (context, state, navigationshell) =>
              MainTabScreen(navigationshell),
          branches: [
            StatefulShellBranch(routes: [
              GoRoute(
                name: homeScreen,
                path: '/home-screen',
                pageBuilder: (context, state) =>
                    const NoTransitionPage<void>(child: HomeScreen()),
              ),
            ]),
            StatefulShellBranch(routes: [
              GoRoute(
                name: webviewScreen,
                path: '/webview-screen',
                pageBuilder: (context, state) =>
                    const NoTransitionPage<void>(child: WebviewScreen()),
              ),
            ]),
          ]),
    ],
  );
}
