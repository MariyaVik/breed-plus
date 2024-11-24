import 'package:flutter/material.dart';

import 'app_colors.dart';

ThemeData themeLight = ThemeData(
  useMaterial3: true,
  brightness: Brightness.light,
  colorScheme: _colorScheme,
  inputDecorationTheme: _inputDecorationTheme,
  elevatedButtonTheme: ElevatedButtonThemeData(style: _elevButtonLight),
  outlinedButtonTheme: OutlinedButtonThemeData(style: _outButtonLight),
  chipTheme: _chipLight,
);

ColorScheme _colorScheme = ColorScheme.fromSwatch().copyWith(
  primary: AppColors.green,
);

ButtonStyle _elevButtonLight = ElevatedButton.styleFrom(
    backgroundColor: AppColors.orange,
    foregroundColor: AppColors.white,
    disabledBackgroundColor: AppColors.greyLight,
    disabledForegroundColor: AppColors.greyMedium,
    padding: const EdgeInsets.all(16),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)));

ButtonStyle _outButtonLight = OutlinedButton.styleFrom(
  foregroundColor: WidgetStateColor.resolveWith(
    (Set<WidgetState> states) => states.contains(WidgetState.pressed)
        ? AppColors.white
        : AppColors.orange,
  ),
  backgroundColor: WidgetStateColor.resolveWith(
    (Set<WidgetState> states) => states.contains(WidgetState.pressed)
        ? AppColors.greenLight
        : AppColors.white,
  ),
  side: BorderSide(
      color: WidgetStateColor.resolveWith((Set<WidgetState> states) =>
          states.contains(WidgetState.pressed)
              ? AppColors.orange
              : AppColors.orange)),
  disabledBackgroundColor: AppColors.greyLight,
  disabledForegroundColor: AppColors.greyMedium,
);

ChipThemeData _chipLight = ChipThemeData(
  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
  showCheckmark: false,
  padding: const EdgeInsets.all(2),
  backgroundColor: AppColors.white,
  selectedColor: AppColors.greenDark,
  labelStyle: TextStyle(
      fontSize: 14,
      color: WidgetStateColor.resolveWith(
        (Set<WidgetState> states) => states.contains(WidgetState.selected)
            ? AppColors.white
            : AppColors.black,
      )),
  side: BorderSide(
    color: WidgetStateColor.resolveWith(
      (Set<WidgetState> states) => states.contains(WidgetState.selected)
          ? AppColors.greenDark
          : AppColors.greyDark,
    ),
  ),
);

InputDecorationTheme _inputDecorationTheme = const InputDecorationTheme(
  suffixIconColor: AppColors.greyDark,
  iconColor: AppColors.greyDark,
  disabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: AppColors.greyLight),
      borderRadius: BorderRadius.all(Radius.circular(13))),
  enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: AppColors.greyDark),
      borderRadius: BorderRadius.all(Radius.circular(13))),
  focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: AppColors.greyDark),
      borderRadius: BorderRadius.all(Radius.circular(13))),
  errorBorder: OutlineInputBorder(
      borderSide: BorderSide(color: AppColors.pinkLight),
      borderRadius: BorderRadius.all(Radius.circular(13))),
  focusedErrorBorder: OutlineInputBorder(
      borderSide: BorderSide(color: AppColors.pinkDark),
      borderRadius: BorderRadius.all(Radius.circular(13))),
);
