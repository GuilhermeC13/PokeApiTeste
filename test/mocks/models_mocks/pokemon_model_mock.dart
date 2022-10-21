import 'package:poke_api_teste/features/data/models/pokemon_model.dart';
import 'package:poke_api_teste/features/data/models/sprites_model.dart';
import 'package:poke_api_teste/features/data/models/stats_model.dart';

const tPokemonModel = PokemonModel(
  height: 7,
  id: 1,
  abilities: ["overgrow", "chlorophyll"],
  name: "bulbasaur",
  sprites: SpritesModel(
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
  stats: [
    StatsModel(baseStat: 45, name: 'hp'),
    StatsModel(baseStat: 49, name: 'attack'),
    StatsModel(baseStat: 49, name: 'defense'),
    StatsModel(baseStat: 65, name: 'special-attack'),
    StatsModel(baseStat: 65, name: 'special-defense'),
    StatsModel(baseStat: 45, name: 'speed'),
  ],
  weight: 69,
);

const tListPokemonModel = [
  PokemonModel(
    height: 7,
    id: 1,
    abilities: ["overgrow", "chlorophyll"],
    name: "bulbasaur",
    sprites: SpritesModel(
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
    stats: [
      StatsModel(baseStat: 45, name: 'hp'),
      StatsModel(baseStat: 49, name: 'attack'),
      StatsModel(baseStat: 49, name: 'defense'),
      StatsModel(baseStat: 65, name: 'special-attack'),
      StatsModel(baseStat: 65, name: 'special-defense'),
      StatsModel(baseStat: 45, name: 'speed'),
    ],
    weight: 69,
  ),
];
