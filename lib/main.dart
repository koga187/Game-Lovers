import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:game_lovers_app/features/games/data/datasources/game_remote_data_source.dart';
import 'package:game_lovers_app/features/games/domain/repositories/game_repository.dart';
import 'package:game_lovers_app/features/games/domain/usecases/list_games.dart';
import 'package:game_lovers_app/features/home/presentation/bloc/home_page_bloc.dart';
import 'package:game_lovers_app/features/home/presentation/pages/home_page.dart';
import 'package:oktoast/oktoast.dart';
import 'package:provider/provider.dart';
import 'package:responsive_framework/responsive_wrapper.dart';
import 'package:responsive_framework/utils/scroll_behavior.dart';

import 'features/games/data/repositories/game_repository_impl.dart';

void main() {
  runApp(MultiProvider(providers: [
    Provider(
      create: (context) => Dio(),
    ),
    Provider<GameRemoteDataSource>(
      create: (context) => GameRemoteDataSourceImpl(
        httpClient: context.read<Dio>(),
      ),
    ),
    Provider<GameRepository>(
      create: (context) => GameRepositoryImpl(
        gameRemoteDataSource: context.read<GameRemoteDataSource>(),
      ),
    ),
    Provider(
      create: (context) => ListGames(
        gameRepository: context.read<GameRepository>(),
      ),
    ),
    BlocProvider(
      create: (context) => HomePageBloc(
        listGames: context.read<ListGames>(),
      ),
    )
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OKToast(
      child: MaterialApp(
        builder: (context, widget) => ResponsiveWrapper.builder(
          ClampingScrollWrapper.builder(context, widget!),
          defaultScale: true,
          breakpoints: const [
            ResponsiveBreakpoint.resize(350, name: MOBILE),
            ResponsiveBreakpoint.autoScale(600, name: TABLET),
            ResponsiveBreakpoint.resize(800, name: DESKTOP),
            ResponsiveBreakpoint.autoScale(1200, name: 'XL'),
          ],
        ),
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.yellow,
        ),
        home: const HomePage(),
      ),
    );
  }
}
