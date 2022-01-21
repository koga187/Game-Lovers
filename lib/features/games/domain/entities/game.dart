import 'package:equatable/equatable.dart';

class Game extends Equatable {
  const Game(
      {required this.id,
      required this.name,
      required this.description,
      required this.imageId,}
  );

  final int id;
  final String name;
  final int imageId;
  final String description;


  @override
  List<Object?> get props => [
        id,
        name,
      ];
}