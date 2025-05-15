import 'dart:convert';
import 'package:http/http.dart' as http;

import '../domain/entity/cat.dart';

class CatService {
  final String _baseUrl = 'https://api.thecatapi.com/v1/images/search';

  Future<Cat> fetchRandomCat() async {
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
        return Cat.fromJson(jsonResponse[0]);
      } else {
        throw Exception('No cat data found');
      }
    } else {
      throw Exception('Failed to load cat');
    }
  }
}
