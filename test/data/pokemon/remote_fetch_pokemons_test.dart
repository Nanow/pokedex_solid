import 'dart:convert';
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mocktail/mocktail.dart';
import 'package:pokedex_youtube/domain/entities/pokemon_list_entity.dart';
import 'package:pokedex_youtube/infra/http_wrapper.dart';
import 'package:pokedex_youtube/models/pokeon_list_model.dart';

class HttpWrapperMock extends Mock implements HttpWrapper {}

class HttpClientRequestMock extends Mock implements HttpClientRequest {}

class RemoteFetchPokemons {
  final HttpWrapperMock httpClient;

  RemoteFetchPokemons({required this.httpClient});

  Future<PokemonListEntity> call() async {
    final response = await httpClient.get(
      url:
          "raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json",
    );
    final decodeJson = jsonDecode(response.body);
    return PokeListModel.fromJson(decodeJson).toEntity();
  }
}

void main() {
  late HttpWrapperMock httpMock;

  setUp(() {
    httpMock = HttpWrapperMock();
    when(() => httpMock.get(url: any(named: "url"))).thenAnswer(
        (invocation) async => http.Response("""{"data": 1}""", 200));
  });

  test('Should call method with the rigth params', () async {
    final sut =
        new RemoteFetchPokemons(httpClient: httpMock); //System under test
    await sut.call();
  });

  test('Should call the correct endpoint', () async {
    final sut =
        new RemoteFetchPokemons(httpClient: httpMock); //System under test

    await sut.call();

    verify(
      () => httpMock.get(
        url:
            "raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json",
      ),
    ).called(1);
  });

  test('Should return a pokemon List', () async {
    final sut = new RemoteFetchPokemons(
      httpClient: httpMock,
    ); //System under test

    final actual = await sut.call();
    final expected = isA<PokemonListEntity>();

    expect(actual, expected);
  });
}
