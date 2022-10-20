import 'package:dartz/dartz.dart';
import 'package:poke_api_teste/core/errors/failures.dart';
import 'package:poke_api_teste/features/domain/entities/pokemon_entity.dart';
import 'package:poke_api_teste/features/domain/repositories/pokemon_repository.dart';

class GetPokemonsUsecase {
  final PokemonRepository repository;

  GetPokemonsUsecase(this.repository);

  Future<Either<Failure, List<PokemonEntity>>> call(int offSet) async {
    return await repository.getPokemons(offSet);
  }
}
