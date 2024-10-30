import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_bloc_state/buisness_logic_layey/cubit/characters_cubit.dart';
import 'package:movie_bloc_state/data/api/charachter_api.dart';
import 'package:movie_bloc_state/data/repository/character_repository.dart';
import 'package:movie_bloc_state/presentation/screens/characters_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          CharactersCubit(CharacterRepository(CharacterApiService())),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: CharacterScreen(),
      ),
    );
  }
}
