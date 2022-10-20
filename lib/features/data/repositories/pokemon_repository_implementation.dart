import 'package:poke_api_teste/core/errors/exceptions.dart';
import 'package:poke_api_teste/features/data/datasources/pokemon_datasource.dart';
import 'package:poke_api_teste/features/domain/entities/pokemon_entity.dart';
import 'package:poke_api_teste/core/errors/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:poke_api_teste/features/domain/repositories/pokemon_repository.dart';

class PokemonRepositoryImplementation implements PokemonRepository {
  final PokemonDatasource datasource;

  PokemonRepositoryImplementation(this.datasource);

  @override
  Future<Either<Failure, List<PokemonEntity>>> getPokemons(int offSet) async {
    try {
      final result = await datasource.getPokemons(offSet);
      return Right(result);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
