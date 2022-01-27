import 'package:game_lovers_app/core/error/exceptions.dart';
import 'package:game_lovers_app/core/network/network_info.dart';
import 'package:game_lovers_app/features/games/data/datasources/game_local_data_source.dart';
import 'package:game_lovers_app/features/games/data/datasources/game_remote_data_source.dart';
import 'package:game_lovers_app/features/games/domain/entities/game.dart';
import 'package:game_lovers_app/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:game_lovers_app/features/games/domain/repositories/game_repository.dart';

class GameRepositoryImpl implements GameRepository {
  GameRepositoryImpl({
    required this.gameRemoteDataSource,
    required this.gameLocalDataSource,
    required this.networkInfo,
  });

  final GameRemoteDataSource gameRemoteDataSource;
  final GameLocalDataSource gameLocalDataSource;
  final NetworkInfo networkInfo;

  @override
  Future<Either<Failure, List<Game>>> listGames({
    required int limit,
    required int offset,
    required int idPlatform,
  }) async {
    if (await networkInfo.connectivityResult) {
      try {
        final success = await gameRemoteDataSource.listGames(
            limit: limit, offset: offset, idPlatform: idPlatform);
        await gameLocalDataSource.insertMultipleGames(success, idPlatform);
        return Right(success);
      } catch (e) {
        if (e is TooManyRequestsException) {
          return Left(
            TooManyRequestsFailure(),
          );
        }

        if (e is CacheException) {
          return Left(
            CacheFailure(),
          );
        }
        return Left(
          ServerFailure(),
        );
      }
    } else {
      try {
        final success = await gameLocalDataSource.getAll(idPlatform);

        return Right(success);
      } catch (e) {
        return Left(
          CacheFailure(),
        );
      }
    }
  }
}
