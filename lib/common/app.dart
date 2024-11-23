import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../features/base/domain/app_cubit.dart';
import '../features/profile/domain/profile_cubit.dart';
import '../features/seach/domain/search_cubit.dart';
import 'navigation/app_router.dart';
import 'theme/app_theme.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    final appRouter = AppRouter();
    return MultiBlocProvider(
      providers: [
        BlocProvider<AppCubit>(create: (_) => AppCubit()),
        BlocProvider<SearchCubit>(create: (_) => SearchCubit()),
        BlocProvider<ProfileCubit>(
          create: (_) => ProfileCubit()..fetchPassports(),
        ),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: 'Порода+',
        theme: AppTheme().light,
        routerDelegate: appRouter.router.routerDelegate,
        routeInformationParser: appRouter.router.routeInformationParser,
        routeInformationProvider: appRouter.router.routeInformationProvider,
      ),
    );
  }
}
