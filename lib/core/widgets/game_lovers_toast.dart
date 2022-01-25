import 'package:flutter/material.dart';
import 'package:game_lovers_app/core/values/colors_game_lovers.dart';
import 'package:game_lovers_app/core/values/styles_game_lovers.dart';
import 'package:oktoast/oktoast.dart';

class GameLoversToast {
  static const messages = {};

  static void showToastWithMessageAndIcon(
    BuildContext context,
    String message,
    IconData icon, {
    Color color = ColorsGameLovers.black,
    int duration = 2,
    double height = 180,
    double width = 200,
    Function? onDismiss,
  }) {
    final toast = Card(
      elevation: 10,
      child: Container(
        padding: const EdgeInsets.all(
          10,
        ),
        width: width,
        height: height,
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                icon,
                color: color,
              ),
              Flexible(
                child: Text(
                  message,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.black,
                  ),
                  // style: context.textTheme.subtitle2
                ),
              )
            ],
          ),
        ),
      ),
    );

    final toastFuture = showToastWidget(
      toast,
      context: context,
      duration: Duration(seconds: duration),
      onDismiss: onDismiss as void Function()? ?? () {},
      dismissOtherToast: true,
    );

    Future.delayed(Duration(seconds: duration), () {
      toastFuture.dismiss();
    });
  }

  static void showToastWithWidgetAndMessage(
    BuildContext context,
    String message,
    Widget widget, {
    int duration = 2,
    double width = 250,
    double height = 265,
    Function()? onDismiss,
  }) {
    final toast = Card(
      elevation: 10,
      child: Container(
        padding: const EdgeInsets.all(
          5,
        ),
        width: width,
        height: height,
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: height * 0.6, child: widget),
              Text(message,
                  textAlign: TextAlign.center,
                  style: StylesGameLovers.bodyBlack)
            ],
          ),
        ),
      ),
    );

    final toastFuture = showToastWidget(
      toast,
      context: context,
      duration: Duration(seconds: duration),
      // ignore: unnecessary_cast
      onDismiss: onDismiss as void Function()? ?? () {},
      dismissOtherToast: true,
    );

    Future.delayed(Duration(seconds: duration), () {
      if (!toastFuture.dismissed) {
        toastFuture.dismiss();
      }
    });
  }
}
