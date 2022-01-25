import 'package:flutter/material.dart';
import 'package:game_lovers_app/core/config/api_config.dart';
import 'package:game_lovers_app/core/values/colors_game_lovers.dart';
import 'package:game_lovers_app/core/values/images_game_lovers.dart';
import 'package:game_lovers_app/core/values/styles_game_lovers.dart';
import 'package:game_lovers_app/core/values/texts_game_lovers.dart';
import 'package:game_lovers_app/features/games/domain/entities/game.dart';

class GamePage extends StatefulWidget {
  const GamePage({Key? key, required this.game}) : super(key: key);

  final Game game;

  @override
  _GamePageState createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  @override
  Widget build(BuildContext context) {
    final double sizeWidth = MediaQuery.of(context).size.width;
    final double sizeHeight = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: ColorsGameLovers.theme,
        ),
        body: _body(sizeWidth, sizeHeight),
      ),
    );
  }

  Widget _body(double sizeWidth, double sizeHeight) {
    return SingleChildScrollView(
      child: Container(
        width: sizeWidth,
        height: sizeHeight,
        // decoration: BoxDecoration(
        //   gradient: LinearGradient(
        //     begin: Alignment.bottomRight,
        //     end: Alignment.topLeft,
        //     colors: [
        //       ColorsGameLovers.yellowLight.withOpacity(.8),
        //       ColorsGameLovers.pinkLight.withOpacity(.8),
        //     ],
        //   ),
        // ),
        child: Column(
          children: [
            SizedBox(
              width: sizeWidth,
              height: sizeHeight * .35,
              child: Image.network(
                baseHttp + widget.game.imageUrl!,
                errorBuilder: (BuildContext context, Object exception,
                    StackTrace? stackTrace) {
                  return Image.asset(ImagesGameLovers.imageGeral);
                },
                fit: BoxFit.fill,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    TextsGameLovers.name,
                    style: StylesGameLovers.bodyBlue,
                  ),
                  Flexible(
                      child: Text(
                    widget.game.name,
                    style: StylesGameLovers.bodyBlack,
                  )),
                ],
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  TextsGameLovers.description,
                  style: StylesGameLovers.bodyBlue,
                ),
                Flexible(
                  child: Text(
                    widget.game.description,
                    style: StylesGameLovers.bodyBlack,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
