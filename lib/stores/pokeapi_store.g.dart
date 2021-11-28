// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokeapi_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$PokeApiStore on _PokeApiStoreBase, Store {
  Computed<PokeListModel?>? _$pokeAPIComputed;

  @override
  PokeListModel? get pokeAPI =>
      (_$pokeAPIComputed ??= Computed<PokeListModel?>(() => super.pokeAPI,
              name: '_PokeApiStoreBase.pokeAPI'))
          .value;
  Computed<PokemonModel?>? _$pokemonAtualComputed;

  @override
  PokemonModel? get pokemonAtual => (_$pokemonAtualComputed ??=
          Computed<PokemonModel?>(() => super.pokemonAtual,
              name: '_PokeApiStoreBase.pokemonAtual'))
      .value;

  final _$_pokeListModelAtom = Atom(name: '_PokeApiStoreBase._pokeListModel');

  @override
  PokeListModel? get _pokeListModel {
    _$_pokeListModelAtom.reportRead();
    return super._pokeListModel;
  }

  @override
  set _pokeListModel(PokeListModel? value) {
    _$_pokeListModelAtom.reportWrite(value, super._pokeListModel, () {
      super._pokeListModel = value;
    });
  }

  final _$_pokemonAtualAtom = Atom(name: '_PokeApiStoreBase._pokemonAtual');

  @override
  PokemonModel? get _pokemonAtual {
    _$_pokemonAtualAtom.reportRead();
    return super._pokemonAtual;
  }

  @override
  set _pokemonAtual(PokemonModel? value) {
    _$_pokemonAtualAtom.reportWrite(value, super._pokemonAtual, () {
      super._pokemonAtual = value;
    });
  }

  final _$corPokemonAtom = Atom(name: '_PokeApiStoreBase.corPokemon');

  @override
  Color? get corPokemon {
    _$corPokemonAtom.reportRead();
    return super.corPokemon;
  }

  @override
  set corPokemon(Color? value) {
    _$corPokemonAtom.reportWrite(value, super.corPokemon, () {
      super.corPokemon = value;
    });
  }

  final _$posicaoAtualAtom = Atom(name: '_PokeApiStoreBase.posicaoAtual');

  @override
  int? get posicaoAtual {
    _$posicaoAtualAtom.reportRead();
    return super.posicaoAtual;
  }

  @override
  set posicaoAtual(int? value) {
    _$posicaoAtualAtom.reportWrite(value, super.posicaoAtual, () {
      super.posicaoAtual = value;
    });
  }

  final _$_PokeApiStoreBaseActionController =
      ActionController(name: '_PokeApiStoreBase');

  @override
  void fetchPokemonList() {
    final _$actionInfo = _$_PokeApiStoreBaseActionController.startAction(
        name: '_PokeApiStoreBase.fetchPokemonList');
    try {
      return super.fetchPokemonList();
    } finally {
      _$_PokeApiStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPokemonAtual({required int index}) {
    final _$actionInfo = _$_PokeApiStoreBaseActionController.startAction(
        name: '_PokeApiStoreBase.setPokemonAtual');
    try {
      return super.setPokemonAtual(index: index);
    } finally {
      _$_PokeApiStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  Widget getImage({String? numero}) {
    final _$actionInfo = _$_PokeApiStoreBaseActionController.startAction(
        name: '_PokeApiStoreBase.getImage');
    try {
      return super.getImage(numero: numero);
    } finally {
      _$_PokeApiStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
corPokemon: ${corPokemon},
posicaoAtual: ${posicaoAtual},
pokeAPI: ${pokeAPI},
pokemonAtual: ${pokemonAtual}
    ''';
  }
}
