import 'dart:convert';
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mocktail/mocktail.dart';
import 'package:pokedex_youtube/domain/entities/pokemon_list_entity.dart';
import 'package:pokedex_youtube/domain/error/domain_error.dart';
import 'package:pokedex_youtube/infra/http_wrapper.dart';
import 'package:pokedex_youtube/models/pokeon_list_model.dart';

class HttpWrapperMock extends Mock implements HttpWrapper {}

class HttpClientRequestMock extends Mock implements HttpClientRequest {}

abstract class FetchPokemons {
  Future<PokemonListEntity> call();
}

class RemoteFetchPokemons extends FetchPokemons {
  final HttpWrapperMock httpClient;

  RemoteFetchPokemons({required this.httpClient});

  Future<PokemonListEntity> call() async {
    Map<String, dynamic>? responseData;
    try {
      final response = await httpClient.get(
        url:
            "raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json",
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
    return when(() => httpMock.get(url: any(named: "url")));
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
          url:
              "raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json",
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
