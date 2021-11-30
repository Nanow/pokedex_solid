import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mocktail/mocktail.dart';
import 'package:pokedex_youtube/data/pokemon/remote_fetch_pokemon.dart';
import 'package:pokedex_youtube/domain/domain.dart';
import 'package:pokedex_youtube/domain/entities/pokemon_list_entity.dart';
import 'package:pokedex_youtube/domain/error/domain_error.dart';
import 'package:pokedex_youtube/infra/http_wrapper.dart';

class HttpWrapperMock extends Mock implements HttpWrapper {}

class HttpClientRequestMock extends Mock implements HttpClientRequest {}

void main() {
  late HttpWrapperMock httpMock;
  late FetchPokemons sut;
  final validReponseBody = """{
   "pokemon": [{
    "id": 1,
    "num": "001",
    "name": "Bulbasaur",
    "img": "http://www.serebii.net/pokemongo/pokemon/001.png",
    "type": [
      "Grass",
      "Poison"
    ],
    "height": "0.71 m",
    "weight": "6.9 kg",
    "candy": "Bulbasaur Candy",
    "candy_count": 25,
    "egg": "2 km",
    "spawn_chance": 0.69,
    "avg_spawns": 69,
    "spawn_time": "20:00",
    "multipliers": [1.58],
    "weaknesses": [
      "Fire",
      "Ice",
      "Flying",
      "Psychic"
    ],
    "next_evolution": [{
      "num": "002",
      "name": "Ivysaur"
    }, {
      "num": "003",
      "name": "Venusaur"
    }]
  }]}""";
  When<Future<http.Response>> mockHttpCall() {
    return when(
        () => httpMock.get(path: any(named: "path"), host: any(named: 'host')));
  }

  void mockHttpResponse({required int statusCode, String? body}) {
    return mockHttpCall().thenAnswer((invocation) async =>
        http.Response(body ?? validReponseBody, statusCode));
  }

  void mockHttpError({required dynamic error}) {
    return mockHttpCall().thenThrow(error);
  }

  setUp(() {
    httpMock = HttpWrapperMock();
    mockHttpResponse(statusCode: 200);
  });

  group("Rules", () {
    test('Should call method with the rigth params', () async {
      sut = new RemoteFetchPokemons(httpClient: httpMock); //System under test
      await sut.call();
    });

    test('Should call the correct endpoint', () async {
      sut = new RemoteFetchPokemons(httpClient: httpMock); //System under test

      await sut.call();

      verify(
        () => httpMock.get(
          host: "raw.githubusercontent.com",
          path: "Biuni/PokemonGO-Pokedex/master/pokedex.json",
        ),
      ).called(1);
    });

    test('Should return a pokemon List', () async {
      sut = new RemoteFetchPokemons(
        httpClient: httpMock,
      ); //System under test

      final actual = await sut.call();
      final expected = isA<PokemonListEntity>();

      expect(actual, expected);
    });
  });

  group("Exceptions", () {
    test("Should throw unexpected excpetion if status code is not 200",
        () async {
      mockHttpResponse(statusCode: 404);

      sut = new RemoteFetchPokemons(httpClient: httpMock); //System under test

      final actual = sut.call();
      final expected = throwsA(DomainError.unexpeced);
      expect(actual, expected);
    });
    test("Should throw invalidData excpetion if json is in invalid format",
        () async {
      mockHttpResponse(statusCode: 200, body: """{"data": []} """);

      sut = new RemoteFetchPokemons(
        httpClient: httpMock,
      ); //System under test

      final actual = sut.call();
      final expected = throwsA(DomainError.invalidData);
      expect(actual, expected);
    });
    test("Should throw unexpected excpetion if http throws", () async {
      mockHttpError(error: Exception());

      sut = new RemoteFetchPokemons(
        httpClient: httpMock,
      ); //System under test

      final actual = sut.call();
      final expected = throwsA(DomainError.unexpeced);
      expect(actual, expected);
    });
  });
}
