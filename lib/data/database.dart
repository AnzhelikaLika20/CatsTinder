import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

part 'database.g.dart';

class Cats extends Table {
  TextColumn get id => text()();
  TextColumn get imageUrl => text()();
  TextColumn get breed => text()();
  TextColumn get description => text()();

  @override
  Set<Column> get primaryKey => {id};
}

class LikedCats extends Table {
  TextColumn get catId =>
      text().customConstraint('REFERENCES cats(id) ON DELETE CASCADE')();

  DateTimeColumn get likedAt => dateTime()();

  @override
  Set<Column> get primaryKey => {catId};
}

@DriftDatabase(tables: [Cats, LikedCats])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  Future<List<Cat>> getAllCats() => select(cats).get();

  Future<Cat?> getCatById(String id) =>
      (select(cats)..where((tbl) => tbl.id.equals(id))).getSingleOrNull();

  Future<void> insertCat(Cat cat) => into(cats).insertOnConflictUpdate(cat);

  Future<List<LikedCat>> getAllLikedCats() =>
      (select(likedCats)..orderBy([
        (t) => OrderingTerm(expression: t.likedAt, mode: OrderingMode.desc),
      ])).get();

  Future<void> likeCat(String catId, DateTime likedAt) async {
    final catExists = await getCatById(catId);
    if (catExists == null) {
      throw Exception('Cat should exist before liking');
    }
    await into(likedCats).insertOnConflictUpdate(
      LikedCatsCompanion(catId: Value(catId), likedAt: Value(likedAt)),
    );
  }

  Future<void> unlikeCat(String catId) =>
      (delete(likedCats)..where((t) => t.catId.equals(catId))).go();

  Future<bool> isCatLiked(String catId) async {
    final likedCat =
        await (select(likedCats)
          ..where((t) => t.catId.equals(catId))).getSingleOrNull();
    return likedCat != null;
  }
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'cat_app.sqlite'));
    return NativeDatabase(file);
  });
}
