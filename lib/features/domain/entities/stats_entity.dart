import 'package:equatable/equatable.dart';

class StatsEntity extends Equatable {
  final int baseStat;
  final String name;

  const StatsEntity({
    required this.baseStat,
    required this.name,
  });

  @override
  List<Object?> get props => [baseStat, name];
}
