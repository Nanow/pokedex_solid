import '../entities/pokemon_list_entity.dart';

abstract class FetchPokemons {
  Future<PokemonListEntity> call();
}
