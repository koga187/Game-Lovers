part of 'theme_bloc.dart';

abstract class ThemeState extends Equatable {
  const ThemeState(this.themeData);

  final ThemeData themeData;

  @override
  List<Object> get props => [];
}

class ThemeInitial extends ThemeState {
  const ThemeInitial({
    required ThemeData themeData,
  }) : super(themeData);
}

class LoadingTheme extends ThemeState {
  const LoadingTheme(ThemeData themeData) : super(themeData);
}
