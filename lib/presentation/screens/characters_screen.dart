import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_bloc_state/buisness_logic_layey/cubit/characters_cubit.dart';
import 'package:movie_bloc_state/constants/myColors.dart';
import 'package:movie_bloc_state/data/model/character.dart';
import 'package:movie_bloc_state/presentation/widgets/character_item.dart';

class CharacterScreen extends StatefulWidget {
  const CharacterScreen({super.key});

  @override
  State<CharacterScreen> createState() => _CharacterScreenState();
}

class _CharacterScreenState extends State<CharacterScreen> {
  List<Character>? allCharacter;
  @override
  void initState() {
    super.initState();
    // Convert BlocProvider from Lazy to Active
    allCharacter = BlocProvider.of<CharactersCubit>(context).getAllCharacter();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: MyColor.myGray,
        appBar: AppBar(
          backgroundColor: MyColor.myYellow,
          foregroundColor: MyColor.myGray,
          title: const Text('Characters'),
        ),
        body: BlocBuilder<CharactersCubit, CharactersState>(
          builder: (context, state) {
            if (state is CharactersIsLoaded) {
              allCharacter = (state).characters;
              return GridView.builder(
                itemCount: allCharacter!.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, mainAxisSpacing: 1, crossAxisSpacing: 1,childAspectRatio: 2/3),
                itemBuilder: (context, index) {
                  return CharacterItem(character: allCharacter![index]);
                },
              );
            } else {
              return const Center(child: CircularProgressIndicator(color: Colors.yellow,));
            }
          },
        ));
  }
}
