import 'package:get_it/get_it.dart';
import '../data/cat_repository_impl.dart';
import '../presentation/cubit/liked_cats_cubit.dart';

final getIt = GetIt.instance;

void setupDI() {
  getIt.registerSingleton<LikedCatsCubit>(LikedCatsCubit());
  getIt.registerSingleton<CatRepositoryImpl>(CatRepositoryImpl());
}
