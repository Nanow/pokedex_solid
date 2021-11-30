import 'package:pokedex_youtube/domain/entities/pokemon_list_entity.dart';
import 'package:pokedex_youtube/domain/error/domain_error.dart';
import 'package:pokedex_youtube/models/pokemon_model.dart';

class PokeListModel {
  List<PokemonModel>? pokemon;

  PokeListModel({this.pokemon});

  PokeListModel.fromJson(Map<String, dynamic> json) {
    try {
      pokemon = <PokemonModel>[];
      json['pokemon'].forEach((v) {
        pokemon!.add(new PokemonModel.fromJson(v));
      });
    } catch (e) {
      throw DomainError.invalidData;
    }
  }

  PokemonListEntity toEntity() {
    final pokemons = this.pokemon?.map((e) => e.toEntity()).toList();
    return PokemonListEntity(pokemons: pokemons);
  }
}
