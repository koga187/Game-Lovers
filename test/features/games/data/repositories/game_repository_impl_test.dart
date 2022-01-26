import 'package:flutter_test/flutter_test.dart';
import 'package:game_lovers_app/core/error/exceptions.dart';
import 'package:game_lovers_app/features/games/data/datasources/game_remote_data_source.dart';
import 'package:game_lovers_app/features/games/data/model/game_model.dart';
import 'package:game_lovers_app/features/games/data/repositories/game_repository_impl.dart';
import 'package:game_lovers_app/features/games/domain/entities/game.dart';

import 'package:mocktail/mocktail.dart';

class MockGameRemoteDataSource extends Mock implements GameRemoteDataSource {}

void main() {
  late GameRepositoryImpl repository;
  late MockGameRemoteDataSource mockGameRemoteDataSource;

  const tLimit = 10;
  const tOffset = 10;
  const tIdPlatform = 1;
  const tGameModel = GameModel(
    id: 1,
    name: 'text name',
    description: 'text description',
    imageUrl: 'url image',
    genres: ['genres', 'name'],
    platforms: ['platforms', 'name'],
  );
  const Game tGame = tGameModel;

  setUp(() {
    mockGameRemoteDataSource = MockGameRemoteDataSource();
    repository =
        GameRepositoryImpl(gameRemoteDataSource: mockGameRemoteDataSource);
  });

  group(
    'listGames',
    () {
      test(
        'Should make a successful call to the remote data source',
        () async {
          // arrange
          when(
            () => mockGameRemoteDataSource.listGames(
              limit: tLimit,
              offset: tOffset,
              idPlatform: tIdPlatform,
            ),
          ).thenAnswer((_) async => [tGameModel]);
          // act
          final result = await repository.listGames(
              idPlatform: tIdPlatform, limit: tLimit, offset: tOffset);
          // assert
          expect(result.isRight(), isTrue);
        },
      );

      test(
        'Should return server failure when the call to remote data source is unsuccessful',
        () async {
          // arrange
          when(
            () => mockGameRemoteDataSource.listGames(
              limit: tLimit,
              offset: tOffset,
              idPlatform: tIdPlatform,
            ),
          ).thenThrow(
            ServerException(),
          );
          // act
          final result = await repository.listGames(
              idPlatform: tIdPlatform, limit: tLimit, offset: tOffset);
          // assert
          expect(result.isLeft(), isTrue);
        },
      );

      test(
        'Should bring the response of a successful call from the remote data source',
        () async {
          // arrange
          when(
            () => mockGameRemoteDataSource.listGames(
              limit: tLimit,
              offset: tOffset,
              idPlatform: tIdPlatform,
            ),
          ).thenAnswer((_) async => [tGameModel]);
          // act
          final result = await repository.listGames(
              idPlatform: tIdPlatform, limit: tLimit, offset: tOffset);
          // assert
          expect(result.fold((l) => null, (r) => r), [tGameModel]);
        },
      );
    },
  );
}
