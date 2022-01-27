import 'package:drift/drift.dart';

class GenreTable extends Table {
  TextColumn get name => text().nullable()();
  IntColumn get gameId => integer()();
}
