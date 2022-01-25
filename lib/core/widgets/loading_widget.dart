import 'package:flutter/material.dart';
import 'package:game_lovers_app/core/values/images_game_lovers.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10.0),
      child: Image.asset(ImagesGameLovers.loading),
    );
  }
}
