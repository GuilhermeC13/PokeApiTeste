import 'package:poke_api_teste/features/domain/entities/pokemon_entity.dart';
import 'package:poke_api_teste/features/domain/entities/sprites_entity.dart';
import 'package:poke_api_teste/features/domain/entities/stats_entity.dart';

const tListPokemonEntity = [
  PokemonEntity(
      height: 20,
      id: 1,
      abilities: ["overgrow", "chlorophyll"],
      name: "bulbasaur",
      sprites: SpritesEntity(
          dreamWorld: DreamWorldSpritesEntity(
              frontDefault:
                  "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/dream-world/1.svg",
              frontFemale: null),
          home: HomeSpritesEntity(
              frontDefault:
                  "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/1.png",
              frontFemale: null,
              frontShiny:
                  "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/shiny/1.png",
              frontShinyFemale: null),
          officialArtwork: OfficialArtworkSpritesEntity(
              frontDefault:
                  "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/1.png")),
      stats: [
        StatsEntity(baseStat: 45, name: 'hp'),
        StatsEntity(baseStat: 49, name: 'attack'),
        StatsEntity(baseStat: 45, name: 'defense'),
        StatsEntity(baseStat: 65, name: 'special-attack'),
        StatsEntity(baseStat: 65, name: 'special-defense'),
        StatsEntity(baseStat: 45, name: 'speed'),
      ],
      weight: 69),
];
