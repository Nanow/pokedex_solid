import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:pokedex_youtube/domain/entities/pokemon_entity.dart';
import 'package:pokedex_youtube/domain/entities/pokemon_list_entity.dart';
import 'package:pokedex_youtube/domain/usecase/usecases.dart';

import '../consts/consts_app.dart';

part 'pokeapi_store.g.dart';

class PokeApiStore = _PokeApiStoreBase with _$PokeApiStore;

abstract class _PokeApiStoreBase with Store {
  final FetchPokemons fetchPokemons;

  @observable
  PokemonListEntity? _pokeListModel;

  @observable
  PokemonEntity? _pokemonAtual;

  @observable
  Color? corPokemon;

  @observable
  int? posicaoAtual;

  _PokeApiStoreBase({required this.fetchPokemons});

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
      return fetchPokemons.call();
    } catch (error, stacktrace) {
      print("Erro ao carregar lista" + stacktrace.toString());
      return null;
    }
  }
}
