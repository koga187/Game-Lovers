import 'package:flutter/material.dart';
import 'package:game_lovers_app/core/values/colors_game_lovers.dart';
import 'package:responsive_framework/responsive_grid.dart';

class GameLoversGridView extends StatefulWidget {
  const GameLoversGridView({Key? key}) : super(key: key);

  @override
  _GameLoversGridViewState createState() => _GameLoversGridViewState();
}

class _GameLoversGridViewState extends State<GameLoversGridView> {
  @override
  Widget build(BuildContext context) {
    final double size = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.all(12),
      child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: checkSize(size),
              crossAxisSpacing: MediaQuery.of(context).size.height * .02,
              mainAxisSpacing: MediaQuery.of(context).size.width * .02),
          itemCount: 300,
          itemBuilder: (BuildContext context, int index) {
            return Container(
                width: MediaQuery.of(context).size.width * .1,
                child: Center(child: Text('$index')),
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(10),
                    ),
                    boxShadow: [
                      BoxShadow(
                          blurRadius: 5,
                          color: Colors.grey,
                          offset: Offset(1, 2))
                    ],
                    gradient: LinearGradient(
                      begin: Alignment.bottomRight,
                      end: Alignment.topLeft,
                      colors: [
                        ColorsGameLovers.yellowLight.withOpacity(.8),
                        ColorsGameLovers.pinkLight.withOpacity(.8),
                      ],
                    )));
            // Card(
            //   color: Colors.amber,
            //   child: Center(child: Text('$index')),
            // );
          }),
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
