import 'package:game_lovers_app/features/games/domain/entities/game.dart';

class GameModel extends Game {
  const GameModel({
    required int id,
    required String name,
    required String description,
    required String imageUrl,
  }) : super(
          id: id,
          name: name,
          description: description,
          imageUrl: imageUrl,
        );

  factory GameModel.fromJson(Map<String, dynamic> json) {
    return GameModel(
      id: json['id'],
      name: json['name'],
      description: json['summary'],
      imageUrl: getImageUrl(json['screenshots'] as List<dynamic>),
    );
  }
}

String getImageUrl(List<dynamic> list) {
  try {
    if (list.isNotEmpty) {
      final url = list.first['url'];
      return url;
    } else {
      return '';
    }
  } catch (e) {
    return '';
  }
}
