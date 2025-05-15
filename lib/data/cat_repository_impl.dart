import '../domain/entity/cat.dart';
import '../domain/repository/cat_repository.dart';

class CatRepositoryImpl implements CatRepository {
  @override
  Future<List<Cat>> fetchCats() async {
    await Future.delayed(const Duration(seconds: 2));
    return List.generate(
      10,
          (i) => Cat(
        id: 'cat_$i',
        imageUrl: 'https://placekitten.com/400/40${i%5}',
        breed: 'Breed ${i % 3}',
        description: 'Description of Breed ${i % 3}',
      ),
    );
  }
}
