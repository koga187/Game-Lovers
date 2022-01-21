import 'package:flutter/material.dart';
import 'package:game_lovers_app/core/values/colors_game_lovers.dart';
import 'package:game_lovers_app/core/values/images_game_lovers.dart';
import 'package:game_lovers_app/core/values/styles_game_lovers.dart';
import 'package:game_lovers_app/core/values/texts_game_lovers.dart';
import 'package:game_lovers_app/features/games/presentation/widgets/game_lovers_gridview.dart';
import 'package:responsive_framework/responsive_framework.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
          tab(text: TextsGameLovers.nitendoSwitch),
          tab(text: TextsGameLovers.pc),
          tab(text: TextsGameLovers.web),
          tab(text: TextsGameLovers.ps4),
          tab(text: TextsGameLovers.xbox),
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
                    value: 14,
                  ),
                  Condition.largerThan(
                    name: DESKTOP,
                    value: 16,
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
      GameLoversGridView(),
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
