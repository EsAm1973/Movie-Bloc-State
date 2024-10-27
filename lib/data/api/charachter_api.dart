import 'dart:convert';
import 'package:movie_bloc_state/constants/strings.dart';
import 'package:movie_bloc_state/data/model/character.dart';
import 'package:http/http.dart' as http;

class CharacterApiService {
  Future<List<Character>> fetchAllCharacters() async {
    final url = Uri.parse('$baseUrl/character');
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final List<dynamic> results = data['results'];
        return results.map((item) => Character.fromJson(item)).toList();
      } else {
        print('Failed to load characters: ${response.statusCode}');
        return [];
      }
    } catch (e) {
      print('Error fetching characters: $e');
      return [];
    }
  }

  Future<Character?> fetchSingleCharacter(int id) async {
    final url = Uri.parse('$baseUrl/character/$id');
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return Character.fromJson(data);
      } else {
        print('Failed to load character: ${response.statusCode}');
        return null;
      }
    } catch (e) {
      print('Error fetching character: $e');
      return null;
    }
  }
}
