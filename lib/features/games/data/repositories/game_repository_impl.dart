import 'package:game_lovers_app/core/error/exceptions.dart';
import 'package:game_lovers_app/features/games/data/datasources/game_remote_data_source.dart';
import 'package:game_lovers_app/features/games/domain/entities/game.dart';
import 'package:game_lovers_app/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:game_lovers_app/features/games/domain/repositories/game_repository.dart';

class GameRepositoryImpl implements GameRepository {
  GameRepositoryImpl({
    required this.gameRemoteDataSource,
  });

  final GameRemoteDataSource gameRemoteDataSource;

  @override
  Future<Either<Failure, List<Game>>> listGames({
    required int limit,
    required int offset,
    required int idPlatform,
  }) async {
    try {
      final success = await gameRemoteDataSource.listGames(
          limit: limit, offset: offset, idPlatform: idPlatform);

      return Right(success);
    } catch (e) {
      if (e is TooManyRequestsException) {
        return Left(TooManyRequestsFailure());
      }
      return Left(
        ServerFailure(),
      );
    }
  }

  @override
  Future<Either<Failure, String>> urlScreenshot({required int idScreenshots}) {
    // TODO: implement urlScreenshot
    throw UnimplementedError();
  }
}
