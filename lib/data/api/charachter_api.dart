import 'dart:convert';
import 'package:movie_bloc_state/constants/strings.dart';
import 'package:http/http.dart' as http;

class CharacterApiService {
  Future<List<dynamic>> fetchAllCharacters() async {
    final url = Uri.parse('$baseUrl/character');
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final List<dynamic> results = data['results'];
        return results;
      } else {
        print('Failed to load characters: ${response.statusCode}');
        return [];
      }
    } catch (e) {
      print('Error fetching characters: $e');
      return [];
    }
  }

  Future<dynamic> fetchSingleCharacter(int id) async {
    final url = Uri.parse('$baseUrl/character/$id');
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return data;
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
