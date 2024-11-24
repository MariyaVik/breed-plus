import 'package:breed_plus/features/profile/ui/add_genotype_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../features/base/ui/base_screen.dart';
import '../../features/login/ui/login_screen.dart';
import '../../features/profile/ui/add_passport_screen.dart';
import '../../features/profile/ui/animal_details_screen.dart';
import '../../features/seach/ui/result_screen.dart';
import '../../features/super_duper_algorithm/index.dart';
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
          GoRoute(
            name: RouteName.addPassport,
            path: '/${RouteName.addPassport}',
            builder: (context, state) => const AddPassportScreen(),
          ),
          GoRoute(
            name: RouteName.addGenotype,
            path: '/${RouteName.addGenotype}',
            builder: (context, state) => const AddGenotypeScreen(),
          ),
          GoRoute(
            name: RouteName.result,
            path: '/${RouteName.result}',
            builder: (context, state) => ResultScreen(
              // костыль
              info: state.extra as List<dynamic>,
            ),
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
