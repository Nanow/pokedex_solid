import 'dart:convert';

import 'package:pokedex_youtube/models/pokeon_list_model.dart';

import '../../domain/domain.dart';
import '../../infra/infra.dart';

class RemoteFetchPokemons extends FetchPokemons {
  final HttpWrapper httpClient;

  RemoteFetchPokemons({required this.httpClient});

  Future<PokemonListEntity> call() async {
    Map<String, dynamic>? responseData;
    try {
      final response = await httpClient.get(
        host: "raw.githubusercontent.com",
        path: "/Biuni/PokemonGO-Pokedex/master/pokedex.json",
      );
      if (response.statusCode != 200) {
        throw DomainError.unexpeced;
      }
      responseData = jsonDecode(response.body);
    } catch (e) {
      throw DomainError.unexpeced;
    }

    return PokeListModel.fromJson(responseData!).toEntity();
  }
}
