import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:game_lovers_app/core/values/colors_game_lovers.dart';
import 'package:game_lovers_app/core/values/images_game_lovers.dart';
import 'package:game_lovers_app/core/values/styles_game_lovers.dart';
import 'package:game_lovers_app/core/values/texts_game_lovers.dart';
import 'package:game_lovers_app/core/widgets/game_lovers_toast.dart';
import 'package:game_lovers_app/core/widgets/loading_widget.dart';
import 'package:game_lovers_app/features/games/domain/usecases/list_games.dart';
import 'package:game_lovers_app/features/home/presentation/bloc/home_page_bloc.dart';
import 'package:game_lovers_app/features/home/presentation/widgets/home_gridview.dart';
import 'package:responsive_framework/responsive_framework.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late HomePageBloc xboxBloc;
  late HomePageBloc nintendoBloc;
  late HomePageBloc browserBloc;
  late HomePageBloc playStationBloc;
  late HomePageBloc pcBloc;

  @override
  void initState() {
    super.initState();
    xboxBloc = HomePageBloc(
      listGames: context.read<ListGames>(),
    )..add(const ListGamesEvent(limit: 10, offset: 10, idPlatform: 49));
    nintendoBloc = HomePageBloc(
      listGames: context.read<ListGames>(),
    );
    browserBloc = HomePageBloc(
      listGames: context.read<ListGames>(),
    );
    playStationBloc = HomePageBloc(
      listGames: context.read<ListGames>(),
    );
    pcBloc = HomePageBloc(
      listGames: context.read<ListGames>(),
    );
  }

  @override
  void dispose() {
    xboxBloc.close();
    nintendoBloc.close();
    browserBloc.close();
    playStationBloc.close();
    pcBloc.close();
    super.dispose();
  }

  Future<void> _handleStateUpdate(
      BuildContext context, HomePageState state) async {
    if (state is Loading) {
      GameLoversToast.showToastWithWidgetAndMessage(
        context,
        TextsGameLovers.defaultLoadingMessage,
        const LoadingWidget(),
      );
    }
    if (state is Error) {
      GameLoversToast.showToastWithMessageAndIcon(
        context,
        state.message,
        Icons.error,
        color: ColorsGameLovers.red,
        duration: 5,
        width: 300,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        length: 5,
        child: Scaffold(
          appBar: AppBar(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 260,
                  height: 29,
                  child: Text(
                    TextsGameLovers.gameLovers,
                    textAlign: TextAlign.center,
                    style: StylesGameLovers.titleAppBar,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(left: 13),
                  height: 50,
                  width: 50,
                  child: Image.asset(
                    ImagesGameLovers.logo,
                    color: ColorsGameLovers.black,
                  ),
                ),
              ],
            ),
            backgroundColor: ColorsGameLovers.theme,
            elevation: 0,
            bottom: tabBar(),
          ),
          body: _body(),
          backgroundColor: Colors.white,
        ),
      ),
    );
  }

  TabBar tabBar() {
    return TabBar(
        isScrollable: true,
        labelColor: ColorsGameLovers.black,
        unselectedLabelColor: Colors.white,
        indicatorSize: TabBarIndicatorSize.label,
        indicator: const BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10), topRight: Radius.circular(10)),
            color: Colors.white),
        tabs: [
          tab(text: TextsGameLovers.xbox),
          tab(text: TextsGameLovers.nitendoSwitch),
          tab(text: TextsGameLovers.pc),
          tab(text: TextsGameLovers.web),
          tab(text: TextsGameLovers.ps4),
        ]);
  }

  Tab tab({required String text}) {
    return Tab(
      child: Align(
        alignment: Alignment.center,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            text,
            style: StylesGameLovers.bodyBlack.copyWith(
              fontSize: ResponsiveValue(
                context,
                defaultValue: 14.0,
                valueWhen: const [
                  Condition.smallerThan(
                    name: DESKTOP,
                    value: 14.0,
                  ),
                  Condition.largerThan(
                    name: DESKTOP,
                    value: 16.0,
                  )
                ],
              ).value,
            ),
          ),
        ),
      ),
    );
  }

  _body() {
    return TabBarView(children: [
      BlocConsumer(
        listener: _handleStateUpdate,
        bloc: xboxBloc,
        builder: (context, state) {
          return HomeGridView(
            homePageBloc: xboxBloc,
          );
        },
      ),
      Icon(Icons.movie),
      Icon(Icons.games),
      Icon(Icons.apps),
      Icon(Icons.movie),
    ]);
    // return Stack(children: [
    //   Positioned.fill(
    //     child: Align(
    //       alignment: Alignment.bottomRight,
    //       child: Image.asset(
    //         ImagesGameLovers.detail,
    //         color: ColorsGameLovers.pink,
    //       ),
    //     ),
    //   ),
    //   const TabBarView(children: [
    //     GameLoversGridView(),
    //     Icon(Icons.movie),
    //     Icon(Icons.games),
    //     Icon(Icons.apps),
    //     Icon(Icons.movie),
    //   ]),
    // ]);
  }
}
