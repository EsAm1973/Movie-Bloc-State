import 'package:flutter/material.dart';
import 'package:movie_bloc_state/constants/myColors.dart';
import 'package:movie_bloc_state/data/model/character.dart';

class CharacterItem extends StatelessWidget {
  const CharacterItem({super.key, required this.character});
  final Character character;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            width: double.infinity,
            height: 290,
            margin: const EdgeInsets.only(left: 10, top: 10, right: 10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Colors.white, width: 4)),
            child: GridTile(
              footer: Container(
                width: double.infinity,
                color: Colors.black54,
                alignment: Alignment.bottomCenter,
                padding: const EdgeInsets.all(5),
                child: Text(
                  overflow: TextOverflow.ellipsis,
                  character.name,
                  style: const TextStyle(
                      color: MyColor.myWhite,
                      fontWeight: FontWeight.bold,
                      fontSize: 17),
                ),
              ),
              child: Container(
                child: character.image.isNotEmpty
                    ? FadeInImage.assetNetwork(
                        placeholder: 'assets/Loading.gif',
                        image: character.image,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      )
                    : Image.asset('assets/placeholder.png'),
              ),
            ),
          )
        ],
      ),
    );
  }
}
