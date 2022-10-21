import 'package:dartz/dartz.dart';
import 'package:poke_api_teste/core/errors/failures.dart';
import 'package:poke_api_teste/features/domain/entities/pokemon_entity.dart';

abstract class PokemonRepository {
  Future<Either<Failure, List<PokemonEntity>>> getPokemons(int offSet);
}
