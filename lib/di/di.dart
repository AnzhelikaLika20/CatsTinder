import 'package:get_it/get_it.dart';
import '../data/database.dart';
import '../data/cat_repository_impl.dart';
import '../presentation/cubit/connectivity_cubit.dart';
import '../presentation/cubit/liked_cats_cubit.dart';

final getIt = GetIt.instance;

Future<void> setupDI() async {
  final database = AppDatabase();

  getIt.registerSingleton<AppDatabase>(database);
  getIt.registerSingleton<CatRepositoryImpl>(CatRepositoryImpl(database: database));
  getIt.registerSingleton<LikedCatsCubit>(LikedCatsCubit(database: database));
  getIt.registerSingleton<ConnectivityCubit>(ConnectivityCubit());
}
