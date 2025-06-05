import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:drift/drift.dart' as drift;

import '../domain/entity/cat.dart' as domain;
import 'database.dart' as db;

class CatRepositoryImpl {
  final db.AppDatabase database;

  CatRepositoryImpl({required this.database});

  final String _baseUrl = 'https://api.thecatapi.com/v1/images/search';

  Future<domain.Cat> fetchRandomCat() async {
    try {
      final response = await http.get(
        Uri.parse('$_baseUrl?has_breeds=true'),
        headers: {
          'x-api-key':
              'live_Glq2WZtc9HQzJWoik4ouHXtOc8nu171Y8QuCc93OvJEkOoemf0aBqgzwi3ivSh0e',
        },
      );

      if (response.statusCode == 200) {
        final List<dynamic> jsonResponse = json.decode(response.body);
        if (jsonResponse.isNotEmpty) {
          final fetchedCat = domain.Cat.fromJson(jsonResponse[0]);

          final companion = db.CatsCompanion(
            id: drift.Value(fetchedCat.id),
            imageUrl: drift.Value(fetchedCat.imageUrl),
            breed: drift.Value(fetchedCat.breed),
            description: drift.Value(fetchedCat.description),
          );

          await database.into(database.cats).insertOnConflictUpdate(companion);

          return fetchedCat;
        } else {
          throw Exception('No cat data found');
        }
      } else {
        throw Exception('Failed to load cat');
      }
    } catch (e) {
      final cachedCats = await database.getAllCats();

      if (cachedCats.isNotEmpty) {
        cachedCats.shuffle();
        final cachedCat = cachedCats.first;

        return domain.Cat(
          id: cachedCat.id,
          imageUrl: cachedCat.imageUrl,
          breed: cachedCat.breed,
          description: cachedCat.description,
        );
      }

      throw Exception('No cached cats and failed to fetch from network: $e');
    }
  }
}
