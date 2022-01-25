import 'package:equatable/equatable.dart';

class Game extends Equatable {
  const Game({
    required this.id,
    required this.name,
    required this.description,
    required this.imageUrl,
  });

  final int id;
  final String name;
  final String? imageUrl;
  final String description;

  @override
  List<Object?> get props => [
        id,
        name,
      ];
}
