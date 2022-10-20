import 'package:poke_api_teste/features/domain/entities/stats_entity.dart';

class StatsModel extends StatsEntity {
  const StatsModel({required super.baseStat, required super.name});

  factory StatsModel.fromJson(Map<String, dynamic> json) => StatsModel(
        baseStat: json['base_stat'],
        name: json['stat']['name'],
      );

  Map<String, dynamic> toJson() => {
        'base_stat': baseStat,
        'name': name,
      };
}
