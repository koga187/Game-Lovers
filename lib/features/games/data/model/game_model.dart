import 'package:game_lovers_app/features/games/domain/entities/game.dart';

class GameModel extends Game {
  const GameModel(
      {required int id,
      required String name,
      required String description,
      required String imageUrl,
      required List<String?>? genres,
      required List<String?> platforms})
      : super(
          id: id,
          name: name,
          description: description,
          imageUrl: imageUrl,
          genres: genres,
          platform: platforms,
        );

  factory GameModel.fromJson(Map<String, dynamic> json) {
    return GameModel(
      id: json['id'],
      name: json['name'] ?? '',
      description: json['summary'] ?? '',
      imageUrl: json['screenshots'] != null
          ? getImageUrl(json['screenshots'] as List<dynamic>)
          : '',
      genres: json['genres'] != null
          ? getLists(json['genres'] as List<dynamic>)
          : null,
      platforms: getLists(json['platforms'] as List<dynamic>),
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

List<String?> getLists(List<dynamic> list) {
  final values = <String?>[];
  for (final l in list) {
    values.add(l['name']);
  }
  return values;
}
