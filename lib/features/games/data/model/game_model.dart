import 'package:game_lovers_app/features/games/domain/entities/game.dart';

class GameModel extends Game {
  const GameModel({
    required int id,
    required String name,
    required String description,
    required int imageId,
    required int idPlatform
  }) : super(
          id: id,
          name: name,
          description: description,
          imageId: imageId,
        );

  factory GameModel.fromJson(Map<String, dynamic> json) {
    return GameModel(
      id: json['id'],
      name: json['name'],
      description: json['summary'],
      idPlatform: json['platforms'],
      imageId: (json['screenshots'] as List<int>).first,
   
    );
  }


  }