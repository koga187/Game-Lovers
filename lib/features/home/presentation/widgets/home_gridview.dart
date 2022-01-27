import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:game_lovers_app/core/config/api_config.dart';
import 'package:game_lovers_app/core/utils/nav.dart';
import 'package:game_lovers_app/core/values/colors_game_lovers.dart';
import 'package:game_lovers_app/core/values/images_game_lovers.dart';
import 'package:game_lovers_app/core/values/styles_game_lovers.dart';
import 'package:game_lovers_app/core/values/texts_game_lovers.dart';
import 'package:game_lovers_app/core/widgets/game_lovers_toast.dart';
import 'package:game_lovers_app/core/widgets/loading_widget.dart';
import 'package:game_lovers_app/features/games/domain/entities/game.dart';
import 'package:game_lovers_app/features/games/presentation/pages/game_page.dart';
import 'package:game_lovers_app/features/home/presentation/bloc/home_page_bloc.dart';

class HomeGridView extends StatefulWidget {
  const HomeGridView(
      {Key? key, required this.homePageBloc, required this.idPlatform})
      : super(key: key);

  final HomePageBloc homePageBloc;
  final int idPlatform;
  @override
  _HomeGridViewState createState() => _HomeGridViewState();
}

class _HomeGridViewState extends State<HomeGridView> {
  final _games = <Game>[];
  @override
  Widget build(BuildContext context) {
    final double sizeWidth = MediaQuery.of(context).size.width;
    final double sizeHeight = MediaQuery.of(context).size.height;

    return BlocConsumer(
      listener: (context, state) {
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
      },
      bloc: widget.homePageBloc,
      builder: (context, state) {
        if (state is Loaded) {
          _games.addAll(state.list);
        }
        return Padding(
          padding: const EdgeInsets.all(10),
          child: SingleChildScrollView(
            child: Column(
              children: [
                GridView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: checkSize(sizeWidth),
                        crossAxisSpacing: sizeWidth * .02,
                        mainAxisSpacing: sizeWidth * .02),
                    itemCount: _games.length,
                    itemBuilder: (BuildContext context, int index) {
                      return InkWell(
                        onTap: () => push(
                            context,
                            GamePage(
                              game: _games[index],
                            )),
                        child: Container(
                          width: sizeWidth * .1,
                          height: sizeWidth * .1,
                          child: Stack(
                            children: [
                              CachedNetworkImage(
                                imageUrl: baseHttp + _games[index].imageUrl!,
                                width: sizeWidth,
                                fit: BoxFit.fill,
                                errorWidget: (context, url, error) =>
                                    Image.asset(
                                  ImagesGameLovers.imageGeral,
                                  fit: BoxFit.fill,
                                  width: sizeWidth,
                                ),
                                placeholder: (context, url) =>
                                    const CircularProgressIndicator(),
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  SizedBox(
                                    height: sizeWidth * .1,
                                  ),

                                  Container(
                                    width: sizeWidth,
                                    color:
                                        ColorsGameLovers.white.withOpacity(.7),
                                    padding: const EdgeInsets.all(12),
                                    child: Text(
                                      _games[index].name,
                                      style: StylesGameLovers.bodyBlack16,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  //   ],
                                  // ),
                                ],
                              ),
                            ],
                          ),
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                            boxShadow: [
                              BoxShadow(
                                  blurRadius: 5,
                                  color: ColorsGameLovers.greyLight,
                                  offset: Offset(1, 2))
                            ],
                          ),
                        ),
                      );
                    }),
                SizedBox(
                  height: sizeHeight * .05,
                ),
                _games.isEmpty
                    ? Container()
                    : InkWell(
                        onTap: () {
                          widget.homePageBloc.add(ListGamesEvent(
                              limit: _games.length + 10,
                              offset: _games.length,
                              idPlatform: widget.idPlatform));
                        },
                        child: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Icon(
                            Icons.add,
                            size: 30,
                            color: ColorsGameLovers.pink,
                          ),
                        ),
                      )
              ],
            ),
          ),
        );
      },
    );
  }

  checkSize(double sizeWindow) {
    if (sizeWindow >= 800) {
      return 4;
    } else if (sizeWindow < 800 && sizeWindow >= 600) {
      return 3;
    } else {
      return 2;
    }
  }
}
