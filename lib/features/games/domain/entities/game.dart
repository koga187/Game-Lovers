import 'package:equatable/equatable.dart';

class Game extends Equatable {
  const Game({
    required this.id,
    required this.name,
    required this.description,
    required this.imageUrl,
    required this.genres,
    required this.platform,
  });

  final int id;
  final String name;
  final String? imageUrl;
  final String? description;
  final List<String?>? genres;
  final List<String?> platform;

  @override
  List<Object?> get props => [
        id,
        name,
      ];
}
