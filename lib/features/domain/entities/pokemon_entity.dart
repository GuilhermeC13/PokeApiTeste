import 'package:equatable/equatable.dart';
import 'package:poke_api_teste/features/domain/entities/sprites_entity.dart';
import 'package:poke_api_teste/features/domain/entities/stats_entity.dart';

class PokemonEntity extends Equatable {
  final int height;
  final int id;
  final List<String> abilities;
  final String name;
  final SpritesEntity? sprites;
  final List<StatsEntity>? stats;
  final int weight;

  const PokemonEntity({
    required this.height,
    required this.id,
    required this.abilities,
    required this.name,
    required this.sprites,
    required this.stats,
    required this.weight,
  });

  @override
  List<Object?> get props =>
      [height, id, abilities, name, sprites, stats, weight];
}
