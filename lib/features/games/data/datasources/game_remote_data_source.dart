import 'package:dio/dio.dart';
import 'package:game_lovers_app/core/config/api_config.dart';
import 'package:game_lovers_app/core/error/exceptions.dart';
import 'package:game_lovers_app/features/games/data/model/game_model.dart';

abstract class GameRemoteDataSource {
  Future<List<GameModel>> listGames({
    required int limit,
    required int offset,
    required int idPlatform,
  });
}

class GameRemoteDataSourceImpl implements GameRemoteDataSource {
  GameRemoteDataSourceImpl({
    required this.httpClient,
  });

  final Dio httpClient;

  @override
  Future<List<GameModel>> listGames({
    required int limit,
    required int offset,
    required int idPlatform,
  }) async {
    try {
      final response = await httpClient.post(
        baseUrl + 'games',
        options: Options(headers: <String, String>{
          'authorization': 'Bearer' + token,
          'Client-ID': clientID
        }),
        data: '''
              fields name, platforms, summary, screenshots;
              where platforms = $idPlatform;
              limit $limit;
              offset $offset;
              ''',
      );

      final data = response.data as List<dynamic>;

      return data
          .map<GameModel>(
              (map) => GameModel.fromJson(map as Map<String, dynamic>))
          .toList();
    } on DioError catch (e) {
      if (e.response?.statusCode == 429) {
        throw TooManyRequestsException();
      }

      throw ServerException();
    } catch (e) {
      throw ServerException();
    }
  }
}
