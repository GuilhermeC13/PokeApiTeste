import 'package:equatable/equatable.dart';

class SpritesEntity extends Equatable {
  final DreamWorldSpritesEntity? dreamWorld;
  final HomeSpritesEntity? home;
  final OfficialArtworkSpritesEntity? officialArtwork;

  const SpritesEntity(
      {required this.dreamWorld,
      required this.home,
      required this.officialArtwork});

  @override
  List<Object?> get props => [dreamWorld, home, officialArtwork];
}

class DreamWorldSpritesEntity extends Equatable {
  final String frontDefault;
  final String? frontFemale;

  const DreamWorldSpritesEntity(
      {required this.frontDefault, required this.frontFemale});

  @override
  List<Object?> get props => [frontDefault, frontFemale];
}

class HomeSpritesEntity extends Equatable {
  final String? frontDefault;
  final String? frontFemale;
  final String? frontShiny;
  final String? frontShinyFemale;

  const HomeSpritesEntity({
    required this.frontDefault,
    required this.frontFemale,
    required this.frontShiny,
    required this.frontShinyFemale,
  });

  @override
  List<Object?> get props =>
      [frontDefault, frontFemale, frontShiny, frontShinyFemale];
}

class OfficialArtworkSpritesEntity extends Equatable {
  final String frontDefault;

  const OfficialArtworkSpritesEntity({required this.frontDefault});

  @override
  List<Object?> get props => [frontDefault];
}
