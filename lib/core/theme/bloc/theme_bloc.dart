import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:game_lovers_app/core/theme/app_themes.dart';

part 'theme_event.dart';
part 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc()
      : super(
          ThemeInitial(
            themeData: appThemeData[AppTheme.light]!,
          ),
        ) {
    on<ThemeChanged>((event, emit) {
      emit(LoadingTheme(state.themeData));
      emit(
        ThemeInitial(
          themeData: state.themeData == appThemeData[AppTheme.light]!
              ? appThemeData[AppTheme.dark]!
              : appThemeData[AppTheme.light]!,
        ),
      );
    });
  }
}
