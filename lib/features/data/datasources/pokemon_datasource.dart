import 'package:poke_api_teste/features/data/models/pokemon_model.dart';

abstract class PokemonDatasource {
  Future<List<PokemonModel>> getPokemons(int offSet);
}
