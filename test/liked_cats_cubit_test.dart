import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:cats_tinder/domain/entity/cat.dart';
import 'package:cats_tinder/domain/entity/liked_cat.dart';
import 'package:cats_tinder/data/database.dart' show AppDatabase;
import 'package:cats_tinder/presentation/cubit/liked_cats_cubit.dart';

import 'fakes.dart';

class MockAppDatabase extends Mock implements AppDatabase {}

void main() {
  setUpAll(() {
    registerFallbackValue(FakeCat());
    registerFallbackValue(FakeLikedCat());
  });

  late MockAppDatabase mockDatabase;
  late LikedCatsCubit likedCatsCubit;

  final testCat = Cat(
    id: 'cat1',
    imageUrl: 'https://test.com/cat1.jpg',
    breed: 'Breed 1',
    description: 'Test description',
  );

  setUp(() {
    mockDatabase = MockAppDatabase();

    when(() => mockDatabase.getAllLikedCats()).thenAnswer((_) async => []);
    likedCatsCubit = LikedCatsCubit(database: mockDatabase);
  });

  tearDown(() {
    likedCatsCubit.close();
  });

  test('initial state is empty and null filter', () {
    expect(likedCatsCubit.state.likedCats, []);
    expect(likedCatsCubit.state.breedFilter, null);
  });

  blocTest<LikedCatsCubit, LikedCatsState>(
    'adds cat to likedCats',
    setUp: () {
      when(() => mockDatabase.likeCat(any(), any())).thenAnswer((_) async {});
      when(() => mockDatabase.getAllLikedCats()).thenAnswer((_) async => []);
      when(() => mockDatabase.getCatById(any())).thenAnswer((_) async => null);
    },
    build: () => likedCatsCubit,
    act: (cubit) => cubit.addCat(testCat),
    expect:
        () => [
          isA<LikedCatsState>().having((s) => s.likedCats.length, 'length', 1),
        ],
    verify: (_) {
      verify(() => mockDatabase.likeCat(testCat.id, any())).called(1);
    },
  );

  blocTest<LikedCatsCubit, LikedCatsState>(
    'removes cat from likedCats',
    setUp: () {
      final likedCat = LikedCat(cat: testCat, likedAt: DateTime.now());

      when(() => mockDatabase.unlikeCat(testCat.id)).thenAnswer((_) async {});
      when(() => mockDatabase.getAllLikedCats()).thenAnswer((_) async => []);
      when(() => mockDatabase.getCatById(any())).thenAnswer((_) async => null);

      likedCatsCubit.emit(
        LikedCatsState(likedCats: [likedCat], breedFilter: null),
      );
    },
    build: () => likedCatsCubit,
    act:
        (cubit) =>
            cubit.removeCat(LikedCat(cat: testCat, likedAt: DateTime.now())),
    expect:
        () => [
          isA<LikedCatsState>().having((s) => s.likedCats.length, 'length', 0),
        ],
    verify: (_) {
      verify(() => mockDatabase.unlikeCat(testCat.id)).called(1);
    },
  );

  test('sets breed filter', () {
    likedCatsCubit.setBreedFilter('Breed 1');
    expect(likedCatsCubit.state.breedFilter, 'Breed 1');
  });
}
