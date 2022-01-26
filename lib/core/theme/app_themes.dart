import 'package:flutter/material.dart';
import 'package:game_lovers_app/core/values/colors_game_lovers.dart';

enum AppTheme {
  light,
  dark,
}

final appThemeData = {
  AppTheme.light: ThemeData(
    brightness: Brightness.light,
    primaryColor: ColorsGameLovers.theme,
    backgroundColor: ColorsGameLovers.white,
    secondaryHeaderColor: ColorsGameLovers.black,
  ),
  AppTheme.dark: ThemeData(
    brightness: Brightness.dark,
    primaryColor: ColorsGameLovers.theme,
    backgroundColor: ColorsGameLovers.black,
    secondaryHeaderColor: ColorsGameLovers.white,
  )
};
