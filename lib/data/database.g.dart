// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $CatsTable extends Cats with TableInfo<$CatsTable, Cat> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CatsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _imageUrlMeta = const VerificationMeta(
    'imageUrl',
  );
  @override
  late final GeneratedColumn<String> imageUrl = GeneratedColumn<String>(
    'image_url',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _breedMeta = const VerificationMeta('breed');
  @override
  late final GeneratedColumn<String> breed = GeneratedColumn<String>(
    'breed',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _descriptionMeta = const VerificationMeta(
    'description',
  );
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
    'description',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [id, imageUrl, breed, description];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'cats';
  @override
  VerificationContext validateIntegrity(
    Insertable<Cat> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('image_url')) {
      context.handle(
        _imageUrlMeta,
        imageUrl.isAcceptableOrUnknown(data['image_url']!, _imageUrlMeta),
      );
    } else if (isInserting) {
      context.missing(_imageUrlMeta);
    }
    if (data.containsKey('breed')) {
      context.handle(
        _breedMeta,
        breed.isAcceptableOrUnknown(data['breed']!, _breedMeta),
      );
    } else if (isInserting) {
      context.missing(_breedMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
        _descriptionMeta,
        description.isAcceptableOrUnknown(
          data['description']!,
          _descriptionMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_descriptionMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Cat map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Cat(
      id:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}id'],
          )!,
      imageUrl:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}image_url'],
          )!,
      breed:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}breed'],
          )!,
      description:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}description'],
          )!,
    );
  }

  @override
  $CatsTable createAlias(String alias) {
    return $CatsTable(attachedDatabase, alias);
  }
}

class Cat extends DataClass implements Insertable<Cat> {
  final String id;
  final String imageUrl;
  final String breed;
  final String description;
  const Cat({
    required this.id,
    required this.imageUrl,
    required this.breed,
    required this.description,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['image_url'] = Variable<String>(imageUrl);
    map['breed'] = Variable<String>(breed);
    map['description'] = Variable<String>(description);
    return map;
  }

  CatsCompanion toCompanion(bool nullToAbsent) {
    return CatsCompanion(
      id: Value(id),
      imageUrl: Value(imageUrl),
      breed: Value(breed),
      description: Value(description),
    );
  }

  factory Cat.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Cat(
      id: serializer.fromJson<String>(json['id']),
      imageUrl: serializer.fromJson<String>(json['imageUrl']),
      breed: serializer.fromJson<String>(json['breed']),
      description: serializer.fromJson<String>(json['description']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'imageUrl': serializer.toJson<String>(imageUrl),
      'breed': serializer.toJson<String>(breed),
      'description': serializer.toJson<String>(description),
    };
  }

  Cat copyWith({
    String? id,
    String? imageUrl,
    String? breed,
    String? description,
  }) => Cat(
    id: id ?? this.id,
    imageUrl: imageUrl ?? this.imageUrl,
    breed: breed ?? this.breed,
    description: description ?? this.description,
  );
  Cat copyWithCompanion(CatsCompanion data) {
    return Cat(
      id: data.id.present ? data.id.value : this.id,
      imageUrl: data.imageUrl.present ? data.imageUrl.value : this.imageUrl,
      breed: data.breed.present ? data.breed.value : this.breed,
      description:
          data.description.present ? data.description.value : this.description,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Cat(')
          ..write('id: $id, ')
          ..write('imageUrl: $imageUrl, ')
          ..write('breed: $breed, ')
          ..write('description: $description')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, imageUrl, breed, description);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Cat &&
          other.id == this.id &&
          other.imageUrl == this.imageUrl &&
          other.breed == this.breed &&
          other.description == this.description);
}

class CatsCompanion extends UpdateCompanion<Cat> {
  final Value<String> id;
  final Value<String> imageUrl;
  final Value<String> breed;
  final Value<String> description;
  final Value<int> rowid;
  const CatsCompanion({
    this.id = const Value.absent(),
    this.imageUrl = const Value.absent(),
    this.breed = const Value.absent(),
    this.description = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  CatsCompanion.insert({
    required String id,
    required String imageUrl,
    required String breed,
    required String description,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       imageUrl = Value(imageUrl),
       breed = Value(breed),
       description = Value(description);
  static Insertable<Cat> custom({
    Expression<String>? id,
    Expression<String>? imageUrl,
    Expression<String>? breed,
    Expression<String>? description,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (imageUrl != null) 'image_url': imageUrl,
      if (breed != null) 'breed': breed,
      if (description != null) 'description': description,
      if (rowid != null) 'rowid': rowid,
    });
  }

  CatsCompanion copyWith({
    Value<String>? id,
    Value<String>? imageUrl,
    Value<String>? breed,
    Value<String>? description,
    Value<int>? rowid,
  }) {
    return CatsCompanion(
      id: id ?? this.id,
      imageUrl: imageUrl ?? this.imageUrl,
      breed: breed ?? this.breed,
      description: description ?? this.description,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (imageUrl.present) {
      map['image_url'] = Variable<String>(imageUrl.value);
    }
    if (breed.present) {
      map['breed'] = Variable<String>(breed.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CatsCompanion(')
          ..write('id: $id, ')
          ..write('imageUrl: $imageUrl, ')
          ..write('breed: $breed, ')
          ..write('description: $description, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $LikedCatsTable extends LikedCats
    with TableInfo<$LikedCatsTable, LikedCat> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $LikedCatsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _catIdMeta = const VerificationMeta('catId');
  @override
  late final GeneratedColumn<String> catId = GeneratedColumn<String>(
    'cat_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'REFERENCES cats(id) ON DELETE CASCADE',
  );
  static const VerificationMeta _likedAtMeta = const VerificationMeta(
    'likedAt',
  );
  @override
  late final GeneratedColumn<DateTime> likedAt = GeneratedColumn<DateTime>(
    'liked_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [catId, likedAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'liked_cats';
  @override
  VerificationContext validateIntegrity(
    Insertable<LikedCat> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('cat_id')) {
      context.handle(
        _catIdMeta,
        catId.isAcceptableOrUnknown(data['cat_id']!, _catIdMeta),
      );
    } else if (isInserting) {
      context.missing(_catIdMeta);
    }
    if (data.containsKey('liked_at')) {
      context.handle(
        _likedAtMeta,
        likedAt.isAcceptableOrUnknown(data['liked_at']!, _likedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_likedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {catId};
  @override
  LikedCat map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return LikedCat(
      catId:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}cat_id'],
          )!,
      likedAt:
          attachedDatabase.typeMapping.read(
            DriftSqlType.dateTime,
            data['${effectivePrefix}liked_at'],
          )!,
    );
  }

  @override
  $LikedCatsTable createAlias(String alias) {
    return $LikedCatsTable(attachedDatabase, alias);
  }
}

class LikedCat extends DataClass implements Insertable<LikedCat> {
  final String catId;
  final DateTime likedAt;
  const LikedCat({required this.catId, required this.likedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['cat_id'] = Variable<String>(catId);
    map['liked_at'] = Variable<DateTime>(likedAt);
    return map;
  }

  LikedCatsCompanion toCompanion(bool nullToAbsent) {
    return LikedCatsCompanion(catId: Value(catId), likedAt: Value(likedAt));
  }

  factory LikedCat.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return LikedCat(
      catId: serializer.fromJson<String>(json['catId']),
      likedAt: serializer.fromJson<DateTime>(json['likedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'catId': serializer.toJson<String>(catId),
      'likedAt': serializer.toJson<DateTime>(likedAt),
    };
  }

  LikedCat copyWith({String? catId, DateTime? likedAt}) =>
      LikedCat(catId: catId ?? this.catId, likedAt: likedAt ?? this.likedAt);
  LikedCat copyWithCompanion(LikedCatsCompanion data) {
    return LikedCat(
      catId: data.catId.present ? data.catId.value : this.catId,
      likedAt: data.likedAt.present ? data.likedAt.value : this.likedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('LikedCat(')
          ..write('catId: $catId, ')
          ..write('likedAt: $likedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(catId, likedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is LikedCat &&
          other.catId == this.catId &&
          other.likedAt == this.likedAt);
}

class LikedCatsCompanion extends UpdateCompanion<LikedCat> {
  final Value<String> catId;
  final Value<DateTime> likedAt;
  final Value<int> rowid;
  const LikedCatsCompanion({
    this.catId = const Value.absent(),
    this.likedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  LikedCatsCompanion.insert({
    required String catId,
    required DateTime likedAt,
    this.rowid = const Value.absent(),
  }) : catId = Value(catId),
       likedAt = Value(likedAt);
  static Insertable<LikedCat> custom({
    Expression<String>? catId,
    Expression<DateTime>? likedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (catId != null) 'cat_id': catId,
      if (likedAt != null) 'liked_at': likedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  LikedCatsCompanion copyWith({
    Value<String>? catId,
    Value<DateTime>? likedAt,
    Value<int>? rowid,
  }) {
    return LikedCatsCompanion(
      catId: catId ?? this.catId,
      likedAt: likedAt ?? this.likedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (catId.present) {
      map['cat_id'] = Variable<String>(catId.value);
    }
    if (likedAt.present) {
      map['liked_at'] = Variable<DateTime>(likedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('LikedCatsCompanion(')
          ..write('catId: $catId, ')
          ..write('likedAt: $likedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $CatsTable cats = $CatsTable(this);
  late final $LikedCatsTable likedCats = $LikedCatsTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [cats, likedCats];
  @override
  StreamQueryUpdateRules get streamUpdateRules => const StreamQueryUpdateRules([
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'cats',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('liked_cats', kind: UpdateKind.delete)],
    ),
  ]);
}

typedef $$CatsTableCreateCompanionBuilder =
    CatsCompanion Function({
      required String id,
      required String imageUrl,
      required String breed,
      required String description,
      Value<int> rowid,
    });
typedef $$CatsTableUpdateCompanionBuilder =
    CatsCompanion Function({
      Value<String> id,
      Value<String> imageUrl,
      Value<String> breed,
      Value<String> description,
      Value<int> rowid,
    });

final class $$CatsTableReferences
    extends BaseReferences<_$AppDatabase, $CatsTable, Cat> {
  $$CatsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$LikedCatsTable, List<LikedCat>>
  _likedCatsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.likedCats,
    aliasName: $_aliasNameGenerator(db.cats.id, db.likedCats.catId),
  );

  $$LikedCatsTableProcessedTableManager get likedCatsRefs {
    final manager = $$LikedCatsTableTableManager(
      $_db,
      $_db.likedCats,
    ).filter((f) => f.catId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_likedCatsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$CatsTableFilterComposer extends Composer<_$AppDatabase, $CatsTable> {
  $$CatsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get imageUrl => $composableBuilder(
    column: $table.imageUrl,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get breed => $composableBuilder(
    column: $table.breed,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> likedCatsRefs(
    Expression<bool> Function($$LikedCatsTableFilterComposer f) f,
  ) {
    final $$LikedCatsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.likedCats,
      getReferencedColumn: (t) => t.catId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$LikedCatsTableFilterComposer(
            $db: $db,
            $table: $db.likedCats,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$CatsTableOrderingComposer extends Composer<_$AppDatabase, $CatsTable> {
  $$CatsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get imageUrl => $composableBuilder(
    column: $table.imageUrl,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get breed => $composableBuilder(
    column: $table.breed,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$CatsTableAnnotationComposer
    extends Composer<_$AppDatabase, $CatsTable> {
  $$CatsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get imageUrl =>
      $composableBuilder(column: $table.imageUrl, builder: (column) => column);

  GeneratedColumn<String> get breed =>
      $composableBuilder(column: $table.breed, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => column,
  );

  Expression<T> likedCatsRefs<T extends Object>(
    Expression<T> Function($$LikedCatsTableAnnotationComposer a) f,
  ) {
    final $$LikedCatsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.likedCats,
      getReferencedColumn: (t) => t.catId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$LikedCatsTableAnnotationComposer(
            $db: $db,
            $table: $db.likedCats,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$CatsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $CatsTable,
          Cat,
          $$CatsTableFilterComposer,
          $$CatsTableOrderingComposer,
          $$CatsTableAnnotationComposer,
          $$CatsTableCreateCompanionBuilder,
          $$CatsTableUpdateCompanionBuilder,
          (Cat, $$CatsTableReferences),
          Cat,
          PrefetchHooks Function({bool likedCatsRefs})
        > {
  $$CatsTableTableManager(_$AppDatabase db, $CatsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer:
              () => $$CatsTableFilterComposer($db: db, $table: table),
          createOrderingComposer:
              () => $$CatsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer:
              () => $$CatsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> imageUrl = const Value.absent(),
                Value<String> breed = const Value.absent(),
                Value<String> description = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => CatsCompanion(
                id: id,
                imageUrl: imageUrl,
                breed: breed,
                description: description,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String imageUrl,
                required String breed,
                required String description,
                Value<int> rowid = const Value.absent(),
              }) => CatsCompanion.insert(
                id: id,
                imageUrl: imageUrl,
                breed: breed,
                description: description,
                rowid: rowid,
              ),
          withReferenceMapper:
              (p0) =>
                  p0
                      .map(
                        (e) => (
                          e.readTable(table),
                          $$CatsTableReferences(db, table, e),
                        ),
                      )
                      .toList(),
          prefetchHooksCallback: ({likedCatsRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (likedCatsRefs) db.likedCats],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (likedCatsRefs)
                    await $_getPrefetchedData<Cat, $CatsTable, LikedCat>(
                      currentTable: table,
                      referencedTable: $$CatsTableReferences
                          ._likedCatsRefsTable(db),
                      managerFromTypedResult:
                          (p0) =>
                              $$CatsTableReferences(
                                db,
                                table,
                                p0,
                              ).likedCatsRefs,
                      referencedItemsForCurrentItem:
                          (item, referencedItems) =>
                              referencedItems.where((e) => e.catId == item.id),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$CatsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $CatsTable,
      Cat,
      $$CatsTableFilterComposer,
      $$CatsTableOrderingComposer,
      $$CatsTableAnnotationComposer,
      $$CatsTableCreateCompanionBuilder,
      $$CatsTableUpdateCompanionBuilder,
      (Cat, $$CatsTableReferences),
      Cat,
      PrefetchHooks Function({bool likedCatsRefs})
    >;
typedef $$LikedCatsTableCreateCompanionBuilder =
    LikedCatsCompanion Function({
      required String catId,
      required DateTime likedAt,
      Value<int> rowid,
    });
typedef $$LikedCatsTableUpdateCompanionBuilder =
    LikedCatsCompanion Function({
      Value<String> catId,
      Value<DateTime> likedAt,
      Value<int> rowid,
    });

final class $$LikedCatsTableReferences
    extends BaseReferences<_$AppDatabase, $LikedCatsTable, LikedCat> {
  $$LikedCatsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $CatsTable _catIdTable(_$AppDatabase db) =>
      db.cats.createAlias($_aliasNameGenerator(db.likedCats.catId, db.cats.id));

  $$CatsTableProcessedTableManager get catId {
    final $_column = $_itemColumn<String>('cat_id')!;

    final manager = $$CatsTableTableManager(
      $_db,
      $_db.cats,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_catIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$LikedCatsTableFilterComposer
    extends Composer<_$AppDatabase, $LikedCatsTable> {
  $$LikedCatsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<DateTime> get likedAt => $composableBuilder(
    column: $table.likedAt,
    builder: (column) => ColumnFilters(column),
  );

  $$CatsTableFilterComposer get catId {
    final $$CatsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.catId,
      referencedTable: $db.cats,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CatsTableFilterComposer(
            $db: $db,
            $table: $db.cats,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$LikedCatsTableOrderingComposer
    extends Composer<_$AppDatabase, $LikedCatsTable> {
  $$LikedCatsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<DateTime> get likedAt => $composableBuilder(
    column: $table.likedAt,
    builder: (column) => ColumnOrderings(column),
  );

  $$CatsTableOrderingComposer get catId {
    final $$CatsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.catId,
      referencedTable: $db.cats,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CatsTableOrderingComposer(
            $db: $db,
            $table: $db.cats,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$LikedCatsTableAnnotationComposer
    extends Composer<_$AppDatabase, $LikedCatsTable> {
  $$LikedCatsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<DateTime> get likedAt =>
      $composableBuilder(column: $table.likedAt, builder: (column) => column);

  $$CatsTableAnnotationComposer get catId {
    final $$CatsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.catId,
      referencedTable: $db.cats,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CatsTableAnnotationComposer(
            $db: $db,
            $table: $db.cats,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$LikedCatsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $LikedCatsTable,
          LikedCat,
          $$LikedCatsTableFilterComposer,
          $$LikedCatsTableOrderingComposer,
          $$LikedCatsTableAnnotationComposer,
          $$LikedCatsTableCreateCompanionBuilder,
          $$LikedCatsTableUpdateCompanionBuilder,
          (LikedCat, $$LikedCatsTableReferences),
          LikedCat,
          PrefetchHooks Function({bool catId})
        > {
  $$LikedCatsTableTableManager(_$AppDatabase db, $LikedCatsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer:
              () => $$LikedCatsTableFilterComposer($db: db, $table: table),
          createOrderingComposer:
              () => $$LikedCatsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer:
              () => $$LikedCatsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> catId = const Value.absent(),
                Value<DateTime> likedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => LikedCatsCompanion(
                catId: catId,
                likedAt: likedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String catId,
                required DateTime likedAt,
                Value<int> rowid = const Value.absent(),
              }) => LikedCatsCompanion.insert(
                catId: catId,
                likedAt: likedAt,
                rowid: rowid,
              ),
          withReferenceMapper:
              (p0) =>
                  p0
                      .map(
                        (e) => (
                          e.readTable(table),
                          $$LikedCatsTableReferences(db, table, e),
                        ),
                      )
                      .toList(),
          prefetchHooksCallback: ({catId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
                T extends TableManagerState<
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic
                >
              >(state) {
                if (catId) {
                  state =
                      state.withJoin(
                            currentTable: table,
                            currentColumn: table.catId,
                            referencedTable: $$LikedCatsTableReferences
                                ._catIdTable(db),
                            referencedColumn:
                                $$LikedCatsTableReferences._catIdTable(db).id,
                          )
                          as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$LikedCatsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $LikedCatsTable,
      LikedCat,
      $$LikedCatsTableFilterComposer,
      $$LikedCatsTableOrderingComposer,
      $$LikedCatsTableAnnotationComposer,
      $$LikedCatsTableCreateCompanionBuilder,
      $$LikedCatsTableUpdateCompanionBuilder,
      (LikedCat, $$LikedCatsTableReferences),
      LikedCat,
      PrefetchHooks Function({bool catId})
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$CatsTableTableManager get cats => $$CatsTableTableManager(_db, _db.cats);
  $$LikedCatsTableTableManager get likedCats =>
      $$LikedCatsTableTableManager(_db, _db.likedCats);
}
