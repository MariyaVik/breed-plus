import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../features/home/ui/home_screen.dart';
import '../../features/login/ui/login_screen.dart';
import '../error_page.dart';
import 'route_name.dart';

GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class AppRouter {
  late final router = GoRouter(
    navigatorKey: navigatorKey,
    debugLogDiagnostics: true,
    initialLocation: '/${RouteName.login}',
    routes: [
      GoRoute(
        name: RouteName.login,
        path: '/${RouteName.login}',
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        name: RouteName.home,
        path: '/${RouteName.home}',
        builder: (context, state) => const HomeScreen(),
      ),
    ],
    errorPageBuilder: (context, state) {
      return MaterialPage(
        child: ErrorPage(error: state.error.toString()),
      );
    },
  );
}
