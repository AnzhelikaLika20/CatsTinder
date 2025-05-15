import '../entity/cat.dart';

abstract class CatRepository {
  Future<List<Cat>> fetchCats();
}
