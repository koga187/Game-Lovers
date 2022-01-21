import 'package:equatable/equatable.dart';
import 'package:game_lovers_app/core/error/failure.dart';
import 'package:game_lovers_app/core/usecases/usecase.dart';
import 'package:game_lovers_app/features/games/domain/entities/game.dart';
import 'package:game_lovers_app/features/games/domain/repositories/game_repository.dart';
import 'package:dartz/dartz.dart';

class ListGames extends UseCase<List<Game>, ListGamesParams> {
  ListGames({
    required this.gameRepository,
  });

  final GameRepository gameRepository;

  @override
  Future<Either<Failure, List<Game>>> call(
    ListGamesParams params,
  ) =>
      gameRepository.listGames(limit: params.limit, offset: params.offset, idPlatform: params.idPlatform);
}

class ListGamesParams extends Equatable {
  const ListGamesParams({required this.limit, required this.offset, required this.idPlatform});

  final int limit;
  final int offset;
  final int idPlatform;


  @override
  List<Object?> get props => [
        limit, offset, idPlatform
      ];
}