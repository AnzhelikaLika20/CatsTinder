import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mocktail/mocktail.dart';

import 'package:cats_tinder/domain/entity/cat.dart';
import 'package:cats_tinder/domain/entity/liked_cat.dart';
import 'package:cats_tinder/presentation/cubit/liked_cats_cubit.dart';
import 'package:cats_tinder/presentation/cubit/connectivity_cubit.dart';
import 'package:cats_tinder/presentation/screens/cat_screen.dart';
import 'package:cats_tinder/data/cat_repository_impl.dart';

class FakeCat extends Fake implements Cat {}

class FakeLikedCat extends Fake implements LikedCat {}

class MockLikedCatsCubit extends Mock implements LikedCatsCubit {}

class MockConnectivityCubit extends Mock implements ConnectivityCubit {}

class MockCatRepositoryImpl extends Mock implements CatRepositoryImpl {}

void main() {
  setUpAll(() {
    registerFallbackValue(FakeCat());
    registerFallbackValue(FakeLikedCat());
  });

  late MockLikedCatsCubit likedCatsCubit;
  late MockConnectivityCubit connectivityCubit;
  late MockCatRepositoryImpl catRepository;

  final testCat = Cat(
    id: '1',
    imageUrl: 'https://example.com/cat1.jpg',
    breed: 'TestBreed',
    description: 'Test description',
  );

  setUp(() {
    likedCatsCubit = MockLikedCatsCubit();
    connectivityCubit = MockConnectivityCubit();
    catRepository = MockCatRepositoryImpl();

    GetIt.I.reset();

    GetIt.I.registerSingleton<LikedCatsCubit>(likedCatsCubit);
    GetIt.I.registerSingleton<ConnectivityCubit>(connectivityCubit);
    GetIt.I.registerSingleton<CatRepositoryImpl>(catRepository);

    when(
      () => likedCatsCubit.state,
    ).thenReturn(LikedCatsState(likedCats: [], breedFilter: null));
    when(() => likedCatsCubit.stream).thenAnswer(
      (_) => Stream.value(LikedCatsState(likedCats: [], breedFilter: null)),
    );

    when(() => connectivityCubit.state).thenReturn(ConnectivityStatus.online);
    when(
      () => connectivityCubit.stream,
    ).thenAnswer((_) => Stream.value(ConnectivityStatus.online));

    when(() => catRepository.fetchRandomCat()).thenAnswer((_) async => testCat);

    when(() => likedCatsCubit.addCat(any())).thenAnswer((_) async {});
  });

  testWidgets('CatScreen shows cat info and reacts to like button', (
    tester,
  ) async {
    await tester.pumpWidget(const MaterialApp(home: CatScreen()));

    await tester.pump();
    await tester.pump(const Duration(milliseconds: 100));

    expect(find.text('TestBreed'), findsOneWidget);

    final likeButton = find.widgetWithText(ElevatedButton, 'Like');
    if (likeButton.evaluate().isNotEmpty) {
      await tester.tap(likeButton);
      await tester.pump();

      verify(() => likedCatsCubit.addCat(testCat)).called(1);
    }
  });

  testWidgets('Shows offline banner when connectivity is offline', (
    tester,
  ) async {
    when(() => connectivityCubit.state).thenReturn(ConnectivityStatus.offline);
    when(
      () => connectivityCubit.stream,
    ).thenAnswer((_) => Stream.value(ConnectivityStatus.offline));

    await tester.pumpWidget(const MaterialApp(home: CatScreen()));

    await tester.pump();
    await tester.pump(const Duration(milliseconds: 100));

    expect(find.text('offline mode'), findsOneWidget);
  });
}
