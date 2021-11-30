import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mobx/mobx.dart';
import 'package:pokedex_youtube/domain/entities/pokemon_entity.dart';
import 'package:pokedex_youtube/domain/entities/pokemon_list_entity.dart';

import '../consts/consts_app.dart';
import '../models/pokeon_list_model.dart';

part 'pokeapi_store.g.dart';

class PokeApiStore = _PokeApiStoreBase with _$PokeApiStore;

abstract class _PokeApiStoreBase with Store {
  @observable
  PokemonListEntity? _pokeListModel;

  @observable
  PokemonEntity? _pokemonAtual;

  @observable
  Color? corPokemon;

  @observable
  int? posicaoAtual;

  @computed
  PokemonListEntity? get pokeAPI => _pokeListModel;

  @computed
  PokemonEntity? get pokemonAtual => _pokemonAtual;

  @action
  void fetchPokemonList() {
    _pokeListModel = null;
    loadPokeAPI().then((pokeList) {
      _pokeListModel = pokeList;
    });
  }

  PokemonEntity getPokemon({required int index}) {
    return _pokeListModel!.pokemons![index];
  }

  @action
  void setPokemonAtual({required int index}) {
    _pokemonAtual = _pokeListModel!.pokemons![index];
    corPokemon = ConstsApp.getColorType(type: _pokemonAtual!.type![0]);
    posicaoAtual = index;
  }

  @action
  Widget getImage({String? numero}) {
    return Image.network(
      'https://raw.githubusercontent.com/fanzeyi/pokemon.json/master/images/$numero.png',
    );
  }

  Future<PokemonListEntity?> loadPokeAPI() async {
    try {
      final response = await http.get(
        Uri.https(
          "raw.githubusercontent.com",
          "Biuni/PokemonGO-Pokedex/master/pokedex.json",
        ),
      );
      var decodeJson = jsonDecode(response.body);
      return PokeListModel.fromJson(decodeJson).toEntity();
    } catch (error, stacktrace) {
      print("Erro ao carregar lista" + stacktrace.toString());
      return null;
    }
  }
}
