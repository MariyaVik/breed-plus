import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../common/assets_name.dart';
import '../../../common/theme/app_colors.dart';
import '../../profile/ui/profile_page.dart';
import '../../seach/ui/search_page.dart';
import '../data/models/bottom_item.dart';
import '../domain/app_cubit.dart';
import '../domain/app_state.dart';

class BaseScreen extends StatelessWidget {
  BaseScreen({super.key});
  final List<Widget> pages = [
    const ProfilePage(),
    const SearchPage(),
    // Container(
    //   color: Colors.amberAccent,
    // ), // const NewsPage(),
    // Container(
    //   color: Colors.green,
    // ), // const SelectLocationPage(),
    Container(
      color: AppColors.green,
    ),
  ];

  final List<BottomItem> bottomItems = [
    BottomItem(image: AppIcons.bottomProfile, title: 'Профиль'),
    BottomItem(image: AppIcons.bottomSearch, title: 'Поиск'),
    BottomItem(image: AppIcons.bottomSettings, title: 'Настройки'),
  ];

  List<BottomNavigationBarItem> get items => bottomItems
      .map((e) => BottomNavigationBarItem(
            icon: SvgPicture.asset(e.image),
            activeIcon: SvgPicture.asset(
              e.image,
              color: Colors.orange,
            ),
            label: e.title,
          ))
      .toList();

  @override
  Widget build(BuildContext context) {
    final isTablet = MediaQuery.of(context).size.width > 600;
    return BlocBuilder<AppCubit, AppState>(builder: (context, appState) {
      return Scaffold(
        // appBar: CustomAppBar(
        //   user: (context.read<AuthCubit>().state as AuthAuthenticated).user,
        // ),
        body: pages[appState.selectedTab],
        bottomNavigationBar: SizedBox(
          height: isTablet ? 80.0 : 58.0,
          child: BottomNavigationBar(
            showSelectedLabels: false, showUnselectedLabels: false,
            // type: BottomNavigationBarType.fixed,
            iconSize: isTablet ? 36.0 : 22.0,
            // selectedFontSize: isTablet ? 16.0 : 14.0,
            // unselectedFontSize: isTablet ? 16.0 : 12.0,
            currentIndex: appState.selectedTab,
            onTap: (value) {
              context.read<AppCubit>().selectTab(value);
            },
            items: items,
          ),
        ),
      );
    });
  }
}
