import 'package:drift/drift.dart';
import 'package:game_lovers_app/core/database/games_database.dart';
import 'package:game_lovers_app/core/database/tables/game_table.dart';
import 'package:game_lovers_app/core/database/tables/genre_table.dart';
import 'package:game_lovers_app/core/database/tables/platform_table.dart';
import 'package:game_lovers_app/core/error/exceptions.dart';
import 'package:game_lovers_app/features/games/data/model/game_model.dart';

part 'game_local_data_source.g.dart';

@DriftAccessor(tables: [GameTable, GenreTable, PlatformTable])
class GameLocalDataSource extends DatabaseAccessor<GamesDatabase>
    with _$GameLocalDataSourceMixin {
  // this constructor is required so that the main database can create an instance
  // of this object.
  GameLocalDataSource(GamesDatabase db) : super(db);

  Future<void> insertMultipleGames(
      List<GameModel> games, int platformId) async {
    try {
      for (final game in games) {
        await into(gameTable).insert(
          GameTableCompanion.insert(
            id: game.id,
            name: game.name,
            imageUrl: Value(game.imageUrl),
            description: Value(game.description),
            platformId: platformId,
          ),
          mode: InsertMode.insertOrReplace,
        );

        if (game.genres != null) {
          for (final genre in game.genres!) {
            await into(genreTable).insert(
              GenreTableCompanion.insert(
                gameId: game.id,
                name: Value(genre),
              ),
            );
          }
        }

        for (final platform in game.platform) {
          await into(platformTable).insert(
            PlatformTableCompanion.insert(
              gameId: game.id,
              name: Value(platform),
            ),
          );
        }
      }
    } catch (e) {
      throw CacheException();
    }
  }

  Future<List<GameModel>> getAll(int platformId) async {
    try {
      final gamesModel = <GameModel>[];

      final games = await (select(gameTable)
            ..where(
              (a) => a.platformId.equals(platformId),
            ))
          .get();
      for (final game in games) {
        final genres = await (select(genreTable)
              ..where((a) => a.gameId.equals(game.id)))
            .get();
        final platform = await (select(platformTable)
              ..where((a) => a.gameId.equals(game.id)))
            .get();

        final gList = <String?>[];
        final pList = <String?>[];

        for (final g in genres) {
          gList.add(g.name);
        }
        for (final p in platform) {
          pList.add(p.name);
        }

        gamesModel.add(
          GameModel(
              id: game.id,
              genres: gList,
              platforms: pList,
              description: game.description,
              name: game.name,
              imageUrl: game.imageUrl ?? ''),
        );
      }
      return gamesModel;
    } catch (e) {
      throw CacheException();
    }
  }
}
