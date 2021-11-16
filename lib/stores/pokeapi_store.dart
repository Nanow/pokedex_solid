import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mobx/mobx.dart';

import '../consts/consts_app.dart';
import '../models/pokeon_list_model.dart';

part 'pokeapi_store.g.dart';

class PokeApiStore = _PokeApiStoreBase with _$PokeApiStore;

abstract class _PokeApiStoreBase with Store {
  @observable
  PokeListModel? _pokeAPI;

  @observable
  Pokemon? _pokemonAtual;

  @observable
  dynamic corPokemon;

  @observable
  int? posicaoAtual;

  @computed
  PokeListModel? get pokeAPI => _pokeAPI;

  @computed
  Pokemon? get pokemonAtual => _pokemonAtual;

  @action
  void fetchPokemonList() {
    _pokeAPI = null;
    loadPokeAPI().then((pokeList) {
      _pokeAPI = pokeList;
    });
  }

  Pokemon getPokemon({required int index}) {
    return _pokeAPI!.pokemon![index];
  }

  @action
  void setPokemonAtual({required int index}) {
    _pokemonAtual = _pokeAPI!.pokemon![index];
    corPokemon = ConstsApp.getColorType(type: _pokemonAtual!.type![0]);
    posicaoAtual = index;
  }

  @action
  Widget getImage({String? numero}) {
    return Image.network(
      'https://raw.githubusercontent.com/fanzeyi/pokemon.json/master/images/$numero.png',
    );
  }

  Future<PokeListModel?> loadPokeAPI() async {
    try {
      final response = await http.get(
        Uri.https(
          "raw.githubusercontent.com",
          "Biuni/PokemonGO-Pokedex/master/pokedex.json",
        ),
      );
      var decodeJson = jsonDecode(response.body);
      return PokeListModel.fromJson(decodeJson);
    } catch (error, stacktrace) {
      print("Erro ao carregar lista" + stacktrace.toString());
      return null;
    }
  }
}
