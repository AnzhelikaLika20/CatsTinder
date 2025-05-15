import 'package:bloc/bloc.dart';
import '../../domain/entity/liked_cat.dart';
import '../../domain/entity/cat.dart';

class LikedCatsState {
  final List<LikedCat> likedCats;
  final String? breedFilter;

  LikedCatsState({required this.likedCats, required this.breedFilter});

  List<LikedCat> get filteredCats =>
      breedFilter == null || breedFilter == ''
          ? likedCats
          : likedCats.where((cat) => cat.cat.breed == breedFilter).toList();

  LikedCatsState copyWith({
    List<LikedCat>? likedCats,
    String? breedFilter,
  }) =>
      LikedCatsState(
        likedCats: likedCats ?? this.likedCats,
        breedFilter: breedFilter ?? this.breedFilter,
      );
}

class LikedCatsCubit extends Cubit<LikedCatsState> {
  LikedCatsCubit() : super(LikedCatsState(likedCats: [], breedFilter: null));

  void addCat(Cat cat) {
    emit(state.copyWith(
        likedCats: [...state.likedCats, LikedCat(cat: cat, likedAt: DateTime.now())]
    ));
  }

  void removeCat(LikedCat likedCat) {
    emit(state.copyWith(
        likedCats: state.likedCats.where((c) => c != likedCat).toList()
    ));
  }

  void setBreedFilter(String? breed) {
    emit(state.copyWith(breedFilter: breed));
  }
}
