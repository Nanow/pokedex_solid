import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:mobx/mobx.dart';

import '../models/pokemon_detail_model.dart';
import '../models/specie.dart';

part 'pokeapiv2_store.g.dart';

class PokeApiV2Store = _PokeApiV2StoreBase with _$PokeApiV2Store;

abstract class _PokeApiV2StoreBase with Store {
  @observable
  Specie? specie;

  @observable
  PokemonDetailModel? pokeApiV2;

  @action
  Future<void> getInfoPokemon(String nome) async {
    final endpoint = "/api/v2/pokemon/" + nome.toLowerCase();
    try {
      final response = await http.get(Uri.https("pokeapi.co", endpoint));
      var decodeJson = jsonDecode(response.body);
      pokeApiV2 = PokemonDetailModel.fromJson(decodeJson);
    } catch (error, stacktrace) {
      print("Erro ao carregar lista" + stacktrace.toString());
      return null;
    }
  }

  @action
  Future<void> getInfoSpecie(String numPokemon) async {
    try {
      specie = null;
      final response = await http
          .get(Uri.https("pokeapi.co", "api/v2/pokemon-species/" + numPokemon));
      var decodeJson = jsonDecode(response.body);
      var _specie = Specie.fromJson(decodeJson);
      specie = _specie;
    } catch (error, stacktrace) {
      print("Erro ao carregar lista" + stacktrace.toString());
      return null;
    }
  }
}
