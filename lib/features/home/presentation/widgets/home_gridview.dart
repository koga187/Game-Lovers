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
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // sizeWidth > 400
                              //     ? Row(
                              //         mainAxisAlignment:
                              //             MainAxisAlignment.spaceAround,
                              //         children: [
                              //           Text(
                              //             _games[index].name,
                              //             style: StylesGameLovers.bodyBlue,
                              //           ),
                              //           Container(
                              //             width: sizeWidth * .1,
                              //             height: sizeHeight * .1,
                              //             decoration: const BoxDecoration(
                              //               borderRadius: BorderRadius.all(
                              //                 Radius.circular(5),
                              //               ),
                              //             ),
                              //             child: Image.network(
                              //               baseHttp + _games[index].imageUrl!,
                              //               errorBuilder: (BuildContext context,
                              //                   Object exception,
                              //                   StackTrace? stackTrace) {
                              //                 return Image.asset(
                              //                     ImagesGameLovers.imageGeral);
                              //               },
                              //             ),
                              //           ),
                              //         ],
                              //       )
                              //     :
                              Column(
                                children: [
                                  Container(
                                    height:
                                        // sizeWidth < 400
                                        //     ? sizeWidth * .5
                                        // :
                                        sizeWidth * .1,
                                    decoration: const BoxDecoration(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(5),
                                      ),
                                    ),
                                    child: Image.network(
                                      baseHttp + _games[index].imageUrl!,
                                      errorBuilder: (BuildContext context,
                                          Object exception,
                                          StackTrace? stackTrace) {
                                        return Image.asset(
                                            ImagesGameLovers.imageGeral);
                                      },
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                  SizedBox(
                                    height: sizeWidth * .1,
                                  ),
                                  // Row(
                                  //   mainAxisAlignment:
                                  //       MainAxisAlignment.spaceBetween,
                                  //   children: [
                                  //     Padding(
                                  //       padding: const EdgeInsets.only(
                                  //           left: 20, top: 20),
                                  //       child: InkWell(
                                  //         onTap: () => push(
                                  //             context,
                                  //             GamePage(
                                  //               game: _games[index],
                                  //             )),
                                  //         child: const Icon(
                                  //           Icons.east_outlined,
                                  //           color: ColorsGameLovers.pink,
                                  //         ),
                                  //       ),
                                  //     ),
                                  Padding(
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
                          decoration: BoxDecoration(
                              borderRadius: const BorderRadius.all(
                                Radius.circular(10),
                              ),
                              boxShadow: const [
                                BoxShadow(
                                    blurRadius: 5,
                                    color: ColorsGameLovers.greyLight,
                                    offset: Offset(1, 2))
                              ],
                              color:
                                  ColorsGameLovers.yellowLight.withOpacity(.5)
                              // gradient: LinearGradient(
                              //   begin: Alignment.bottomRight,
                              //   end: Alignment.topLeft,
                              //   colors: [
                              //     ColorsGameLovers.yellowLight.withOpacity(.8),
                              //     ColorsGameLovers.pinkLight.withOpacity(.8),
                              //   ],
                              // ),
                              ),
                        ),
                      );
                      // Card(
                      //   color: Colors.amber,
                      //   child: Center(child: Text('$index')),
                      // );
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
    }
    // else if (sizeWindow <= 600 && sizeWindow >= 400) {
    //   return 2;
    // }
    else {
      return 2;
    }
  }
}
