import 'package:movie_bloc_state/data/api/charachter_api.dart';
import 'package:movie_bloc_state/data/model/character.dart';

class CharacterRepository {
  final CharacterApiService characterApiService;

  CharacterRepository(this.characterApiService);

  Future<List<Character>> fetchAllCharacters() async {
    final characters = await characterApiService.fetchAllCharacters();
    return characters.map((item) => Character.fromJson(item)).toList();
  }

  Future<Character> fetchSingleCharacter(int id) async {
    final character = await characterApiService.fetchSingleCharacter(id);
    return Character.fromJson(character);
  }
}
