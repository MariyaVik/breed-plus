import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../features/base/ui/base_screen.dart';
import '../../features/login/ui/login_screen.dart';
import '../../features/profile/ui/animal_details_screen.dart';
import '../../features/super_duper_algorithm/passport.dart';
import '../error_page.dart';
import 'route_name.dart';

GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class AppRouter {
  late final router = GoRouter(
    navigatorKey: navigatorKey,
    debugLogDiagnostics: true,
    initialLocation: '/${RouteName.base}',
    routes: [
      GoRoute(
        name: RouteName.login,
        path: '/${RouteName.login}',
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        name: RouteName.base,
        path: '/${RouteName.base}',
        builder: (context, state) => BaseScreen(),
        routes: [
          GoRoute(
            name: RouteName.details,
            path: '/${RouteName.details}',
            builder: (context, state) {
              return AnimalDetailsScreen(passport: state.extra as Passport);
            },
          ),
        ],
      ),
    ],
    errorPageBuilder: (context, state) {
      return MaterialPage(
        child: ErrorPage(error: state.error.toString()),
      );
    },
  );
}
