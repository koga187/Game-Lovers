import 'package:flutter_test/flutter_test.dart';
import 'package:game_lovers_app/core/error/exceptions.dart';
import 'package:game_lovers_app/core/network/network_info.dart';
import 'package:game_lovers_app/features/games/data/datasources/game_local_data_source.dart';
import 'package:game_lovers_app/features/games/data/datasources/game_remote_data_source.dart';
import 'package:game_lovers_app/features/games/data/model/game_model.dart';
import 'package:game_lovers_app/features/games/data/repositories/game_repository_impl.dart';

import 'package:mocktail/mocktail.dart';

class MockGameRemoteDataSource extends Mock implements GameRemoteDataSource {}

class MockGameLocalDataSource extends Mock implements GameLocalDataSource {}

class MockNetworkInfo extends Mock implements NetworkInfo {}

void main() {
  late GameRepositoryImpl repository;
  late MockGameRemoteDataSource mockGameRemoteDataSource;
  late MockGameLocalDataSource mockGameLocalDataSource;
  late MockNetworkInfo mockNetworkInfo;

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

  setUp(() {
    mockGameRemoteDataSource = MockGameRemoteDataSource();
    mockGameLocalDataSource = MockGameLocalDataSource();
    mockNetworkInfo = MockNetworkInfo();
    repository = GameRepositoryImpl(
      gameRemoteDataSource: mockGameRemoteDataSource,
      gameLocalDataSource: mockGameLocalDataSource,
      networkInfo: mockNetworkInfo,
    );
  });

  group(
    'listGames',
    () {
      test(
        'should check if the device is online',
        () async {
          // arrange
          when(() => mockNetworkInfo.connectivityResult)
              .thenAnswer((_) async => true);
          // act
          repository.listGames(
              idPlatform: tIdPlatform, limit: tLimit, offset: tOffset);
          // assert
          verify(() => mockNetworkInfo.connectivityResult);
        },
      );

      group(
        'is online',
        () {
          setUp(() {
            when(() => mockNetworkInfo.connectivityResult)
                .thenAnswer((_) async => true);
          });

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

              when(
                () => mockGameLocalDataSource
                    .insertMultipleGames([tGameModel], tIdPlatform),
              ).thenAnswer(
                (_) => Future.value(),
              );
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

              when(
                () => mockGameLocalDataSource
                    .insertMultipleGames([tGameModel], tIdPlatform),
              ).thenAnswer(
                (_) => Future.value(),
              );

              // act
              final result = await repository.listGames(
                  idPlatform: tIdPlatform, limit: tLimit, offset: tOffset);
              // assert
              expect(result.fold((l) => null, (r) => r), [tGameModel]);
            },
          );
        },
      );

      group(
        'device is offline',
        () {
          setUp(
            () {
              when(() => mockNetworkInfo.connectivityResult)
                  .thenAnswer((_) async => false);
            },
          );

          test(
            'should return locally cached data when the cached data is present',
            () async {
              // arrange
              when(
                () => mockGameLocalDataSource.getAll(tIdPlatform),
              ).thenAnswer(
                (_) async => [tGameModel],
              );
              // act
              final result = await repository.listGames(
                  idPlatform: tIdPlatform, limit: tLimit, offset: tOffset);
              // assert

              expect(result.isRight(), isTrue);
            },
          );

          test(
            'should return CacheFailure when there is no cached data present',
            () async {
              // arrange
              when(() => mockGameLocalDataSource.getAll(tIdPlatform))
                  .thenThrow(CacheException());
              // act
              final result = await repository.listGames(
                  idPlatform: tIdPlatform, limit: tLimit, offset: tOffset);
              // assert
              expect(result.isLeft(), isTrue);
            },
          );
        },
      );
    },
  );
}
