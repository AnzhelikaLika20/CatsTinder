import 'package:bloc/bloc.dart';

import '../../data/database.dart' as db;
import '../../domain/entity/cat.dart' as domain_cat;
import '../../domain/entity/liked_cat.dart' as domain_liked_cat;

class LikedCatsState {
  final List<domain_liked_cat.LikedCat> likedCats;
  final String? breedFilter;

  LikedCatsState({required this.likedCats, required this.breedFilter});

  List<domain_liked_cat.LikedCat> get filteredCats =>
      breedFilter == null || breedFilter == ''
          ? likedCats
          : likedCats.where((cat) => cat.cat.breed == breedFilter).toList();

  LikedCatsState copyWith({List<domain_liked_cat.LikedCat>? likedCats, String? breedFilter}) =>
      LikedCatsState(
        likedCats: likedCats ?? this.likedCats,
        breedFilter: breedFilter ?? this.breedFilter,
      );
}

class LikedCatsCubit extends Cubit<LikedCatsState> {
  final db.AppDatabase database;

  LikedCatsCubit({required this.database}) : super(LikedCatsState(likedCats: [], breedFilter: null)) {
    _init();
  }

  Future<void> _init() async {
    await _loadLikedCats();
  }

  Future<void> _loadLikedCats() async {
    final likedRows = await database.getAllLikedCats();
    List<domain_liked_cat.LikedCat> likedCats = [];

    for (final likedRow in likedRows) {
      final catRow = await database.getCatById(likedRow.catId);
      if (catRow != null) {
        likedCats.add(domain_liked_cat.LikedCat(
          cat: domain_cat.Cat(
            id: catRow.id,
            imageUrl: catRow.imageUrl,
            breed: catRow.breed,
            description: catRow.description,
          ),
          likedAt: likedRow.likedAt,
        ));
      }
    }

    emit(state.copyWith(likedCats: likedCats));
  }

  Future<void> addCat(domain_cat.Cat cat) async {
    final likedAt = DateTime.now();
    await database.likeCat(cat.id, likedAt);

    final likedCat = domain_liked_cat.LikedCat(cat: cat, likedAt: likedAt);

    emit(state.copyWith(likedCats: [...state.likedCats, likedCat]));
  }

  Future<void> removeCat(domain_liked_cat.LikedCat likedCat) async {
    await database.unlikeCat(likedCat.cat.id);

    final newList = state.likedCats.where((c) => c.cat.id != likedCat.cat.id).toList();
    emit(state.copyWith(likedCats: newList));
  }

  void setBreedFilter(String? breed) {
    emit(state.copyWith(breedFilter: breed));
  }
}
