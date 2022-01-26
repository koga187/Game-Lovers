import 'dart:convert' as convert;

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:game_lovers_app/core/error/exceptions.dart';
import 'package:game_lovers_app/features/games/data/datasources/game_remote_data_source.dart';
import 'package:game_lovers_app/features/games/data/model/game_model.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../fixtures/fixture_reader.dart';

class MockDio extends Mock implements Dio {}

void main() {
  late GameRemoteDataSourceImpl dataSourceImpl;
  late MockDio mockDio;

  const tLimit = 10;
  const tOffset = 10;
  const tIdPlatform = 1;
  final List<GameModel> tListGameModel = convert.json
      .decode(fixture('game.json'))
      .map<GameModel>((map) => GameModel.fromJson(map as Map<String, dynamic>))
      .toList();
  final gameJson = fixture(
    'game.json',
  );

  setUp(() {
    mockDio = MockDio();
    dataSourceImpl = GameRemoteDataSourceImpl(httpClient: mockDio);
  });

  void setUpMockDioSuccess200() {
    when(() => mockDio.post(
          'https://api.igdb.com/v4/games',
          data: '''
              fields id, name, platforms, summary, screenshots.url, genres.name, platforms.name;
              where platforms = $tIdPlatform;
              limit $tLimit;
              offset $tOffset;
              ''',
        )).thenAnswer(
      (_) async => Response(
          requestOptions: RequestOptions(path: ''),
          data: convert.json.decode(gameJson),
          statusCode: 200),
    );
  }

  void setUpMockDioFailure404() {
    when(() => mockDio.post(
          'https://api.igdb.com/v4/games',
          data: '''
              fields id, name, platforms, summary, screenshots.url, genres.name, platforms.name;
              where platforms = $tIdPlatform;
              limit $tLimit;
              offset $tOffset;
              ''',
        )).thenThrow(
      DioError(
        requestOptions: RequestOptions(path: ''),
        response: Response(
          statusCode: 404,
          requestOptions: RequestOptions(path: ''),
        ),
      ),
    );
  }

  void setUpMockDioFailure429() {
    when(() => mockDio.post(
          'https://api.igdb.com/v4/games',
          data: '''
              fields id, name, platforms, summary, screenshots.url, genres.name, platforms.name;
              where platforms = $tIdPlatform;
              limit $tLimit;
              offset $tOffset;
              ''',
        )).thenThrow(
      DioError(
        requestOptions: RequestOptions(path: ''),
        response: Response(
          statusCode: 429,
          requestOptions: RequestOptions(path: ''),
        ),
      ),
    );
  }

  group('listGames', () {
    test(
      'should return ListGame when the response code is 200 (success)',
      () async {
        //arrange
        setUpMockDioSuccess200();
        // act
        final result = await dataSourceImpl.listGames(
            limit: tLimit, offset: tOffset, idPlatform: tIdPlatform);
        // assert
        expect(result, tListGameModel);
      },
    );

    test(
      'should throw a ServerException when the response code is 404',
      () async {
        //arrange
        setUpMockDioFailure404();
        // act
        final call = dataSourceImpl.listGames;
        // assert
        expect(
          () => call(limit: tLimit, offset: tOffset, idPlatform: tIdPlatform),
          throwsA(
            isA<ServerException>(),
          ),
        );
      },
    );

    test(
      'should throw a TooManyRequestsException when the response code is 429',
      () async {
        //arrange
        setUpMockDioFailure429();
        // act
        final call = dataSourceImpl.listGames;
        // assert
        expect(
          () => call(limit: tLimit, offset: tOffset, idPlatform: tIdPlatform),
          throwsA(
            isA<TooManyRequestsException>(),
          ),
        );
      },
    );
  });
}
