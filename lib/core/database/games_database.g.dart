// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'games_database.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class GameTableData extends DataClass implements Insertable<GameTableData> {
  final int id;
  final String name;
  final String? imageUrl;
  final String? description;
  final int platformId;
  GameTableData(
      {required this.id,
      required this.name,
      this.imageUrl,
      this.description,
      required this.platformId});
  factory GameTableData.fromData(Map<String, dynamic> data, {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return GameTableData(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      name: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}name'])!,
      imageUrl: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}image_url']),
      description: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}description']),
      platformId: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}platform_id'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || imageUrl != null) {
      map['image_url'] = Variable<String?>(imageUrl);
    }
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String?>(description);
    }
    map['platform_id'] = Variable<int>(platformId);
    return map;
  }

  GameTableCompanion toCompanion(bool nullToAbsent) {
    return GameTableCompanion(
      id: Value(id),
      name: Value(name),
      imageUrl: imageUrl == null && nullToAbsent
          ? const Value.absent()
          : Value(imageUrl),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      platformId: Value(platformId),
    );
  }

  factory GameTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return GameTableData(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      imageUrl: serializer.fromJson<String?>(json['imageUrl']),
      description: serializer.fromJson<String?>(json['description']),
      platformId: serializer.fromJson<int>(json['platformId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'imageUrl': serializer.toJson<String?>(imageUrl),
      'description': serializer.toJson<String?>(description),
      'platformId': serializer.toJson<int>(platformId),
    };
  }

  GameTableData copyWith(
          {int? id,
          String? name,
          String? imageUrl,
          String? description,
          int? platformId}) =>
      GameTableData(
        id: id ?? this.id,
        name: name ?? this.name,
        imageUrl: imageUrl ?? this.imageUrl,
        description: description ?? this.description,
        platformId: platformId ?? this.platformId,
      );
  @override
  String toString() {
    return (StringBuffer('GameTableData(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('imageUrl: $imageUrl, ')
          ..write('description: $description, ')
          ..write('platformId: $platformId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, imageUrl, description, platformId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is GameTableData &&
          other.id == this.id &&
          other.name == this.name &&
          other.imageUrl == this.imageUrl &&
          other.description == this.description &&
          other.platformId == this.platformId);
}

class GameTableCompanion extends UpdateCompanion<GameTableData> {
  final Value<int> id;
  final Value<String> name;
  final Value<String?> imageUrl;
  final Value<String?> description;
  final Value<int> platformId;
  const GameTableCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.imageUrl = const Value.absent(),
    this.description = const Value.absent(),
    this.platformId = const Value.absent(),
  });
  GameTableCompanion.insert({
    required int id,
    required String name,
    this.imageUrl = const Value.absent(),
    this.description = const Value.absent(),
    required int platformId,
  })  : id = Value(id),
        name = Value(name),
        platformId = Value(platformId);
  static Insertable<GameTableData> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String?>? imageUrl,
    Expression<String?>? description,
    Expression<int>? platformId,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (imageUrl != null) 'image_url': imageUrl,
      if (description != null) 'description': description,
      if (platformId != null) 'platform_id': platformId,
    });
  }

  GameTableCompanion copyWith(
      {Value<int>? id,
      Value<String>? name,
      Value<String?>? imageUrl,
      Value<String?>? description,
      Value<int>? platformId}) {
    return GameTableCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      imageUrl: imageUrl ?? this.imageUrl,
      description: description ?? this.description,
      platformId: platformId ?? this.platformId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (imageUrl.present) {
      map['image_url'] = Variable<String?>(imageUrl.value);
    }
    if (description.present) {
      map['description'] = Variable<String?>(description.value);
    }
    if (platformId.present) {
      map['platform_id'] = Variable<int>(platformId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('GameTableCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('imageUrl: $imageUrl, ')
          ..write('description: $description, ')
          ..write('platformId: $platformId')
          ..write(')'))
        .toString();
  }
}

class $GameTableTable extends GameTable
    with TableInfo<$GameTableTable, GameTableData> {
  final GeneratedDatabase _db;
  final String? _alias;
  $GameTableTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, false,
      type: const IntType(), requiredDuringInsert: true);
  final VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String?> name = GeneratedColumn<String?>(
      'name', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _imageUrlMeta = const VerificationMeta('imageUrl');
  @override
  late final GeneratedColumn<String?> imageUrl = GeneratedColumn<String?>(
      'image_url', aliasedName, true,
      type: const StringType(), requiredDuringInsert: false);
  final VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String?> description = GeneratedColumn<String?>(
      'description', aliasedName, true,
      type: const StringType(), requiredDuringInsert: false);
  final VerificationMeta _platformIdMeta = const VerificationMeta('platformId');
  @override
  late final GeneratedColumn<int?> platformId = GeneratedColumn<int?>(
      'platform_id', aliasedName, false,
      type: const IntType(), requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, name, imageUrl, description, platformId];
  @override
  String get aliasedName => _alias ?? 'game_table';
  @override
  String get actualTableName => 'game_table';
  @override
  VerificationContext validateIntegrity(Insertable<GameTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('image_url')) {
      context.handle(_imageUrlMeta,
          imageUrl.isAcceptableOrUnknown(data['image_url']!, _imageUrlMeta));
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    }
    if (data.containsKey('platform_id')) {
      context.handle(
          _platformIdMeta,
          platformId.isAcceptableOrUnknown(
              data['platform_id']!, _platformIdMeta));
    } else if (isInserting) {
      context.missing(_platformIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => <GeneratedColumn>{};
  @override
  GameTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    return GameTableData.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $GameTableTable createAlias(String alias) {
    return $GameTableTable(_db, alias);
  }
}

class GenreTableData extends DataClass implements Insertable<GenreTableData> {
  final String? name;
  final int gameId;
  GenreTableData({this.name, required this.gameId});
  factory GenreTableData.fromData(Map<String, dynamic> data, {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return GenreTableData(
      name: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}name']),
      gameId: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}game_id'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || name != null) {
      map['name'] = Variable<String?>(name);
    }
    map['game_id'] = Variable<int>(gameId);
    return map;
  }

  GenreTableCompanion toCompanion(bool nullToAbsent) {
    return GenreTableCompanion(
      name: name == null && nullToAbsent ? const Value.absent() : Value(name),
      gameId: Value(gameId),
    );
  }

  factory GenreTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return GenreTableData(
      name: serializer.fromJson<String?>(json['name']),
      gameId: serializer.fromJson<int>(json['gameId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'name': serializer.toJson<String?>(name),
      'gameId': serializer.toJson<int>(gameId),
    };
  }

  GenreTableData copyWith({String? name, int? gameId}) => GenreTableData(
        name: name ?? this.name,
        gameId: gameId ?? this.gameId,
      );
  @override
  String toString() {
    return (StringBuffer('GenreTableData(')
          ..write('name: $name, ')
          ..write('gameId: $gameId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(name, gameId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is GenreTableData &&
          other.name == this.name &&
          other.gameId == this.gameId);
}

class GenreTableCompanion extends UpdateCompanion<GenreTableData> {
  final Value<String?> name;
  final Value<int> gameId;
  const GenreTableCompanion({
    this.name = const Value.absent(),
    this.gameId = const Value.absent(),
  });
  GenreTableCompanion.insert({
    this.name = const Value.absent(),
    required int gameId,
  }) : gameId = Value(gameId);
  static Insertable<GenreTableData> custom({
    Expression<String?>? name,
    Expression<int>? gameId,
  }) {
    return RawValuesInsertable({
      if (name != null) 'name': name,
      if (gameId != null) 'game_id': gameId,
    });
  }

  GenreTableCompanion copyWith({Value<String?>? name, Value<int>? gameId}) {
    return GenreTableCompanion(
      name: name ?? this.name,
      gameId: gameId ?? this.gameId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (name.present) {
      map['name'] = Variable<String?>(name.value);
    }
    if (gameId.present) {
      map['game_id'] = Variable<int>(gameId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('GenreTableCompanion(')
          ..write('name: $name, ')
          ..write('gameId: $gameId')
          ..write(')'))
        .toString();
  }
}

class $GenreTableTable extends GenreTable
    with TableInfo<$GenreTableTable, GenreTableData> {
  final GeneratedDatabase _db;
  final String? _alias;
  $GenreTableTable(this._db, [this._alias]);
  final VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String?> name = GeneratedColumn<String?>(
      'name', aliasedName, true,
      type: const StringType(), requiredDuringInsert: false);
  final VerificationMeta _gameIdMeta = const VerificationMeta('gameId');
  @override
  late final GeneratedColumn<int?> gameId = GeneratedColumn<int?>(
      'game_id', aliasedName, false,
      type: const IntType(), requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [name, gameId];
  @override
  String get aliasedName => _alias ?? 'genre_table';
  @override
  String get actualTableName => 'genre_table';
  @override
  VerificationContext validateIntegrity(Insertable<GenreTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    }
    if (data.containsKey('game_id')) {
      context.handle(_gameIdMeta,
          gameId.isAcceptableOrUnknown(data['game_id']!, _gameIdMeta));
    } else if (isInserting) {
      context.missing(_gameIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => <GeneratedColumn>{};
  @override
  GenreTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    return GenreTableData.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $GenreTableTable createAlias(String alias) {
    return $GenreTableTable(_db, alias);
  }
}

class PlatformTableData extends DataClass
    implements Insertable<PlatformTableData> {
  final String? name;
  final int gameId;
  PlatformTableData({this.name, required this.gameId});
  factory PlatformTableData.fromData(Map<String, dynamic> data,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return PlatformTableData(
      name: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}name']),
      gameId: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}game_id'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || name != null) {
      map['name'] = Variable<String?>(name);
    }
    map['game_id'] = Variable<int>(gameId);
    return map;
  }

  PlatformTableCompanion toCompanion(bool nullToAbsent) {
    return PlatformTableCompanion(
      name: name == null && nullToAbsent ? const Value.absent() : Value(name),
      gameId: Value(gameId),
    );
  }

  factory PlatformTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PlatformTableData(
      name: serializer.fromJson<String?>(json['name']),
      gameId: serializer.fromJson<int>(json['gameId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'name': serializer.toJson<String?>(name),
      'gameId': serializer.toJson<int>(gameId),
    };
  }

  PlatformTableData copyWith({String? name, int? gameId}) => PlatformTableData(
        name: name ?? this.name,
        gameId: gameId ?? this.gameId,
      );
  @override
  String toString() {
    return (StringBuffer('PlatformTableData(')
          ..write('name: $name, ')
          ..write('gameId: $gameId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(name, gameId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PlatformTableData &&
          other.name == this.name &&
          other.gameId == this.gameId);
}

class PlatformTableCompanion extends UpdateCompanion<PlatformTableData> {
  final Value<String?> name;
  final Value<int> gameId;
  const PlatformTableCompanion({
    this.name = const Value.absent(),
    this.gameId = const Value.absent(),
  });
  PlatformTableCompanion.insert({
    this.name = const Value.absent(),
    required int gameId,
  }) : gameId = Value(gameId);
  static Insertable<PlatformTableData> custom({
    Expression<String?>? name,
    Expression<int>? gameId,
  }) {
    return RawValuesInsertable({
      if (name != null) 'name': name,
      if (gameId != null) 'game_id': gameId,
    });
  }

  PlatformTableCompanion copyWith({Value<String?>? name, Value<int>? gameId}) {
    return PlatformTableCompanion(
      name: name ?? this.name,
      gameId: gameId ?? this.gameId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (name.present) {
      map['name'] = Variable<String?>(name.value);
    }
    if (gameId.present) {
      map['game_id'] = Variable<int>(gameId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PlatformTableCompanion(')
          ..write('name: $name, ')
          ..write('gameId: $gameId')
          ..write(')'))
        .toString();
  }
}

class $PlatformTableTable extends PlatformTable
    with TableInfo<$PlatformTableTable, PlatformTableData> {
  final GeneratedDatabase _db;
  final String? _alias;
  $PlatformTableTable(this._db, [this._alias]);
  final VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String?> name = GeneratedColumn<String?>(
      'name', aliasedName, true,
      type: const StringType(), requiredDuringInsert: false);
  final VerificationMeta _gameIdMeta = const VerificationMeta('gameId');
  @override
  late final GeneratedColumn<int?> gameId = GeneratedColumn<int?>(
      'game_id', aliasedName, false,
      type: const IntType(), requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [name, gameId];
  @override
  String get aliasedName => _alias ?? 'platform_table';
  @override
  String get actualTableName => 'platform_table';
  @override
  VerificationContext validateIntegrity(Insertable<PlatformTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    }
    if (data.containsKey('game_id')) {
      context.handle(_gameIdMeta,
          gameId.isAcceptableOrUnknown(data['game_id']!, _gameIdMeta));
    } else if (isInserting) {
      context.missing(_gameIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => <GeneratedColumn>{};
  @override
  PlatformTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    return PlatformTableData.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $PlatformTableTable createAlias(String alias) {
    return $PlatformTableTable(_db, alias);
  }
}

abstract class _$GamesDatabase extends GeneratedDatabase {
  _$GamesDatabase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  late final $GameTableTable gameTable = $GameTableTable(this);
  late final $GenreTableTable genreTable = $GenreTableTable(this);
  late final $PlatformTableTable platformTable = $PlatformTableTable(this);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [gameTable, genreTable, platformTable];
}
