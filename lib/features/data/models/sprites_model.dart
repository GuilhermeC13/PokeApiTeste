import 'package:poke_api_teste/features/domain/entities/sprites_entity.dart';

class SpritesModel extends SpritesEntity {
  const SpritesModel(
      {required super.dreamWorld,
      required super.home,
      required super.officialArtwork});

  factory SpritesModel.fromJson(Map<String, dynamic> json) => SpritesModel(
        dreamWorld: json['dream_world'] != null
            ? DreamWorldSpritesModel.fromJson(json['dream_world'])
            : null,
        home: json['home'] != null
            ? HomeSpritesModel.fromJson(json['home'])
            : null,
        officialArtwork: json['official-artwork'] != null
            ? OfficialArtworkSpritesModel.fromJson(json['official-artwork'])
            : null,
      );

  Map<String, dynamic> toJson() => {
        'dreamWorld': dreamWorld,
        'home': home,
        'officialArtwork': officialArtwork,
      };
}

class DreamWorldSpritesModel extends DreamWorldSpritesEntity {
  const DreamWorldSpritesModel(
      {required super.frontDefault, required super.frontFemale});

  factory DreamWorldSpritesModel.fromJson(Map<String, dynamic> json) =>
      DreamWorldSpritesModel(
        frontDefault: json['front_default'],
        frontFemale: json['front_female'],
      );

  Map<String, dynamic> toJson() => {
        'frontDefault': frontDefault,
        'frontFemale': frontFemale,
      };
}

class HomeSpritesModel extends HomeSpritesEntity {
  const HomeSpritesModel(
      {required super.frontDefault,
      required super.frontFemale,
      required super.frontShiny,
      required super.frontShinyFemale});

  factory HomeSpritesModel.fromJson(Map<String, dynamic> json) =>
      HomeSpritesModel(
        frontDefault: json['front_default'],
        frontFemale: json['front_female'],
        frontShiny: json['front_shiny'],
        frontShinyFemale: json['front_shiny_female'],
      );

  Map<String, dynamic> toJson() => {
        'frontDefault': frontDefault,
        'frontFemale': frontFemale,
        'frontShiny': frontShiny,
        'frontShinyFemale': frontShinyFemale,
      };
}

class OfficialArtworkSpritesModel extends OfficialArtworkSpritesEntity {
  const OfficialArtworkSpritesModel({required super.frontDefault});

  factory OfficialArtworkSpritesModel.fromJson(Map<String, dynamic> json) =>
      OfficialArtworkSpritesModel(
        frontDefault: json['front_default'],
      );

  Map<String, dynamic> toJson() => {
        'frontDefault': frontDefault,
      };
}
