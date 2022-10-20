import 'dart:convert';

import 'package:poke_api_teste/core/http_client/http_client.dart';
import 'package:poke_api_teste/features/data/datasources/endpoints/poke_api_endpoints.dart';
import 'package:poke_api_teste/features/data/datasources/pokemon_datasource.dart';
import 'package:poke_api_teste/features/data/models/pokemon_model.dart';

class PokemonDatasourceImplementation implements PokemonDatasource {
  final HttpClient client;

  PokemonDatasourceImplementation(this.client);

  @override
  Future<List<PokemonModel>> getPokemons(int offSet, {int limit = 20}) async {
    List<PokemonModel> pokemons = [];

    for (int i = offSet; i < offSet + limit; i++) {
      final response = await client.get(PokeApiEndpoints.pokemon(i));

      if (response.statusCode == 200) {
        pokemons.add(PokemonModel.fromJson(jsonDecode(response.body)));
      }
    }

    return pokemons;
  }
}
