part of 'characters_cubit.dart';

@immutable
sealed class CharactersState {}

final class CharactersInitial extends CharactersState {}

class CharactersIsLoaded extends CharactersState {
  final List<Character> characters;

  CharactersIsLoaded({required this.characters});
}

class CharacterIsLoaded extends CharactersState {
  final Character character;

  CharacterIsLoaded({required this.character});
}
