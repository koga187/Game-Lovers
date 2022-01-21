import 'package:game_lovers_app/core/error/failure.dart';
import 'package:game_lovers_app/features/games/domain/entities/game.dart';
import 'package:dartz/dartz.dart';

abstract class GameRepository {
  Future<Either<Failure, List<Game>>> listGames({
    required int limit,
    required int offset,
    required int idPlatform,
  });

  Future<Either<Failure, String>> urlScreenshot({required int idScreenshots});
}
