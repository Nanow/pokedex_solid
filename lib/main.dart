import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:pokedex_youtube/data/pokemon/remote_fetch_pokemon.dart';
import 'package:pokedex_youtube/infra/http_wrapper.dart';

import 'pages/home_page/home_page.dart';
import 'stores/pokeapi_store.dart';
import 'stores/pokeapiv2_store.dart';

void main() {
  GetIt getIt = GetIt.instance;
  getIt.registerSingleton<PokeApiStore>(PokeApiStore(
      fetchPokemons: RemoteFetchPokemons(httpClient: HttpWrapper())));
  getIt.registerSingleton<PokeApiV2Store>(PokeApiV2Store());

  return runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pokedex - Youtube',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Google',
        brightness: Brightness.light,
      ),
      home: HomePage(),
    );
  }
}
