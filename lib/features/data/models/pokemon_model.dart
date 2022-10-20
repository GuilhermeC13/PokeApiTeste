import 'package:poke_api_teste/features/data/models/sprites_model.dart';
import 'package:poke_api_teste/features/data/models/stats_model.dart';
import 'package:poke_api_teste/features/domain/entities/pokemon_entity.dart';

class PokemonModel extends PokemonEntity {
  final List<StatsModel>? stats;
  final SpritesModel? sprites;

  const PokemonModel(
      {required super.height,
      required super.id,
      required super.abilities,
      required super.name,
      required this.sprites,
      required this.stats,
      required super.weight})
      : super(stats: stats, sprites: sprites);

  factory PokemonModel.fromJson(Map<String, dynamic> json) => PokemonModel(
        height: json['height'],
        id: json['id'],
        // ignore: prefer_null_aware_operators
        abilities: json['abilities'] != null
            ? json['abilities']
                .map((json) => json['ability']['name'])
                .toList()
                .cast<String>()
            : null,
        name: json['name'],
        // ignore: prefer_null_aware_operators
        sprites: json['sprites']['other'] != null
            ? SpritesModel.fromJson(json['sprites']['other'])
            : null,
        stats:
            // ignore: prefer_null_aware_operators
            json['stats'] != null
                ? json['stats']
                    .map<StatsModel>((json) => StatsModel.fromJson(json))
                    .toList()
                : null,
        weight: json['weight'],
      );

  Map<String, dynamic> toJson() => {
        'height': height,
        'id': id,
        'abilities': abilities,
        'name': name,
        'sprites': sprites,
        'stats': stats,
        'weight': weight,
      };
}
