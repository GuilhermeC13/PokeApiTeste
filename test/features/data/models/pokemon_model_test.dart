import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:poke_api_teste/features/data/models/pokemon_model.dart';
import 'package:poke_api_teste/features/data/models/sprites_model.dart';
import 'package:poke_api_teste/features/data/models/stats_model.dart';
import 'package:poke_api_teste/features/domain/entities/pokemon_entity.dart';

import '../../../mocks/jsons_mocks/pokemon_json_mock.dart';
import '../../../mocks/models_mocks/pokemon_model_mock.dart';

void main() {
  test('should be a subclass of LeagueEntity', () {
    expect(tPokemonModel, isA<PokemonEntity>());
  });

  test('should return a valid model', () {
    // Arrange
    final Map<String, dynamic> jsonMap = json.decode(pokemonJsonMock);
    // act
    final result = PokemonModel.fromJson(jsonMap);
    // Assert
    expect(result, tPokemonModel);
  });

  test('should return a json map containing the proper data', () {
    // Arrange
    final expectedMap = {
      "height": 20,
      "id": 1,
      "abilities": ["overgrow", "chlorophyll"],
      "name": "bulbasaur",
      "sprites": const SpritesModel(
          dreamWorld: DreamWorldSpritesModel(
              frontDefault:
                  "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/dream-world/1.svg",
              frontFemale: null),
          home: HomeSpritesModel(
              frontDefault:
                  "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/1.png",
              frontFemale: null,
              frontShiny:
                  "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/shiny/1.png",
              frontShinyFemale: null),
          officialArtwork: OfficialArtworkSpritesModel(
              frontDefault:
                  "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/1.png")),
      "stats": const [
        StatsModel(baseStat: 45, name: 'hp'),
        StatsModel(baseStat: 49, name: 'attack'),
        StatsModel(baseStat: 45, name: 'defense'),
        StatsModel(baseStat: 65, name: 'special-attack'),
        StatsModel(baseStat: 65, name: 'special-defense'),
        StatsModel(baseStat: 45, name: 'speed'),
      ],
      "weight": 69
    };
    // act
    final result = tPokemonModel.toJson();
    // Assert
    expect(result, expectedMap);
  });
}
