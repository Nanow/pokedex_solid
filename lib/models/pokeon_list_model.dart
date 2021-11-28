import 'package:pokedex_youtube/models/pokemon_model.dart';

class PokeListModel {
  List<PokemonModel>? pokemon;

  PokeListModel({this.pokemon});

  PokeListModel.fromJson(Map<String, dynamic> json) {
    if (json['pokemon'] != null) {
      pokemon = <PokemonModel>[];
      json['pokemon'].forEach((v) {
        pokemon!.add(new PokemonModel.fromJson(v));
      });
    }
  }
}
