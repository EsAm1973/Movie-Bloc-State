import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:movie_bloc_state/data/model/character.dart';
import 'package:movie_bloc_state/data/repository/character_repository.dart';

part 'characters_state.dart';

class CharactersCubit extends Cubit<CharactersState> {
  final CharacterRepository characterRepository;
  late List<Character> characters;
  late Character character;
  
  CharactersCubit(this.characterRepository) : super(CharactersInitial());

  List<Character> getAllCharacter() {
    characterRepository.fetchAllCharacters().then((characters) {
      emit(CharactersIsLoaded(characters: characters));
      this.characters = characters;
    });
    return characters;
  }

  Character getSingleCharacter(int id) {
    characterRepository.fetchSingleCharacter(id).then((character) {
      emit(CharacterIsLoaded(character: character));
      this.character = character;
    });
    return character;
  }
}
