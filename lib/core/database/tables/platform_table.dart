import 'package:drift/drift.dart';

class PlatformTable extends Table {
  TextColumn get name => text().nullable()();
  IntColumn get gameId => integer()();
}
