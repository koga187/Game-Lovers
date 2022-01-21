import 'package:equatable/equatable.dart';

class Platform extends Equatable {
  const Platform(
      {required this.id,
      required this.namePlatform,
      }
  );

  final int id;
  final String namePlatform;
 


  @override
  List<Object?> get props => [
        id,
        namePlatform,
      ];
}