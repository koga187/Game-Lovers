import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:game_lovers_app/core/database/database_config.dart';
import 'package:game_lovers_app/core/database/tables/game_table.dart';
import 'package:game_lovers_app/core/database/tables/genre_table.dart';
import 'package:game_lovers_app/core/database/tables/platform_table.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

part 'games_database.g.dart';

LazyDatabase _openConnection() {
  // the LazyDatabase util lets us find the right location for the file async.
  return LazyDatabase(() async {
    // put the database file, called db.sqlite here, into the documents folder
    // for your app.
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, databaseName));
    return NativeDatabase(file);
  });
}

@DriftDatabase(tables: [GameTable, GenreTable, PlatformTable])
class GamesDatabase extends _$GamesDatabase {
  GamesDatabase() : super(_openConnection());

  @override
  int get schemaVersion => appSchemaVersion;
}
