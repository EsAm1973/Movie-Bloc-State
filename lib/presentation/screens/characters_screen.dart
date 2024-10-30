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
  List<Character>? searchedForCharacter;
  bool _isSearching = false;
  final TextEditingController _searchController = TextEditingController();

  Widget buildSearchField() {
    return TextField(
      controller: _searchController,
      cursorColor: MyColor.myGray,
      decoration: const InputDecoration(
        hintText: "Find a Character...",
        border: InputBorder.none,
        hintStyle: TextStyle(fontSize: 16, color: MyColor.myGray),
      ),
      style: const TextStyle(fontSize: 16, color: MyColor.myGray),
      onChanged: (searchedCharacter) {
        searchedForCharacter = allCharacter!
            .where((character) =>
                character.name.toLowerCase().startsWith(searchedCharacter))
            .toList();
        setState(() {});
      },
    );
  }

  List<Widget> buildAppBarSearch() {
    if (_isSearching) {
      return [
        IconButton(
            onPressed: () {
              stopSearching();
              Navigator.pop(context);
            },
            icon: const Icon(Icons.clear)),
      ];
    } else {
      return [
        IconButton(
            onPressed: startSearch,
            icon: const Icon(
              Icons.search,
              size: 25,
            ))
      ];
    }
  }

  void startSearch() {
    ModalRoute.of(context)!
        .addLocalHistoryEntry(LocalHistoryEntry(onRemove: stopSearching));
    setState(() {
      _isSearching = true;
    });
  }

  void stopSearching() {
    setState(() {
      _searchController.clear();
      _isSearching = false;
    });
  }

  Widget buildAppBarTitle() {
    return const Text('Characters');
  }

  @override
  void initState() {
    super.initState();
    // Convert BlocProvider from Lazy to Active
    BlocProvider.of<CharactersCubit>(context).getAllCharacter();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: MyColor.myGray,
        appBar: AppBar(
          backgroundColor: MyColor.myYellow,
          foregroundColor: MyColor.myGray,
          title: _isSearching ? buildSearchField() : buildAppBarTitle(),
          actions: buildAppBarSearch(),
        ),
        body: BlocBuilder<CharactersCubit, CharactersState>(
          builder: (context, state) {
            if (state is CharactersIsLoaded) {
              allCharacter = (state).characters;
              return GridView.builder(
                itemCount: _searchController.text.isEmpty
                    ? allCharacter!.length
                    : searchedForCharacter!.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 1,
                    crossAxisSpacing: 1,
                    childAspectRatio: 2 / 3),
                itemBuilder: (context, index) {
                  return CharacterItem(
                      character: _searchController.text.isEmpty
                          ? allCharacter![index]
                          : searchedForCharacter![index]);
                },
              );
            } else {
              return const Center(
                  child: CircularProgressIndicator(
                color: Colors.yellow,
              ));
            }
          },
        ));
  }
}
