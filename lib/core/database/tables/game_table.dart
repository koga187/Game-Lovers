import 'package:drift/drift.dart';

class GameTable extends Table {
  IntColumn get id => integer()();
  TextColumn get name => text()();
  TextColumn get imageUrl => text().nullable()();
  TextColumn get description => text().nullable()();
  IntColumn get platformId => integer()();
}
