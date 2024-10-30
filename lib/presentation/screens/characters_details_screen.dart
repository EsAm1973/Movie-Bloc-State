import 'package:flutter/material.dart';
import 'package:movie_bloc_state/constants/myColors.dart';
import 'package:movie_bloc_state/data/model/character.dart';

class CharactersDetailsScreen extends StatelessWidget {
  const CharactersDetailsScreen({super.key, required this.character});
  final Character character;

  Widget buildSliverAppBar() {
    return SliverAppBar(
      expandedHeight: 600,
      pinned: true,
      stretch: true,
      backgroundColor: MyColor.myGray,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        // title: Text(
        //   character.name,
        //   style: TextStyle(color: MyColor.myGray),
        // ),
        background: Hero(
            tag: character.id,
            child: Image.network(
              character.image,
              fit: BoxFit.cover,
            )),
      ),
    );
  }

  Widget buildCharacterInfo(String title, String value) {
    return RichText(
      overflow: TextOverflow.ellipsis,
      maxLines: 1,
      text: TextSpan(children: [
        TextSpan(
          text: title,
          style: const TextStyle(
              color: MyColor.myWhite,
              fontWeight: FontWeight.bold,
              fontSize: 20),
        ),
        TextSpan(
          text: value,
          style: const TextStyle(color: MyColor.myWhite, fontSize: 18),
        ),
      ]),
    );
  }

  Widget buildDivider(double endIndent) {
    return Divider(
      color: MyColor.myYellow,
      height: 10,
      thickness: 2,
      endIndent: endIndent,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: MyColor.myGray,
          body: CustomScrollView(
            slivers: [
              buildSliverAppBar(),
              SliverList(
                  delegate: SliverChildListDelegate([
                Container(
                  margin: const EdgeInsets.all(15),
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        character.name,
                        style: const TextStyle(
                            color: MyColor.myWhite,
                            fontSize: 24,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      buildCharacterInfo('Status: ', character.status),
                      buildDivider(290),
                      const SizedBox(
                        height: 10,
                      ),
                      buildCharacterInfo('Species: ', character.species),
                      buildDivider(280),
                      const SizedBox(
                        height: 10,
                      ),
                      buildCharacterInfo('Gender: ', character.gender),
                      buildDivider(285),
                      const SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
              ])),
            ],
          )),
    );
  }
}
