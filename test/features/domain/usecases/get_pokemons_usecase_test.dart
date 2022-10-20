import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:poke_api_teste/core/errors/failures.dart';
import 'package:poke_api_teste/features/domain/entities/pokemon_entity.dart';
import 'package:poke_api_teste/features/domain/repositories/pokemon_repository.dart';
import 'package:poke_api_teste/features/domain/usecases/get_pokemons_usecase.dart';

import '../../../mocks/pokemon_entity_mock.dart';
import '../../../mocks/repositories_mocks/pokemon_repository_mock.dart';

void main() {
  late GetPokemonsUsecase usecase;
  late PokemonRepository repository;

  setUp(() {
    repository = PokemonRepositoryMock();
    usecase = GetPokemonsUsecase(repository);
  });

  test('should get a list of league entity', () async {
    // Arrange
    when(() => repository.getPokemons(0)).thenAnswer((_) async =>
        const Right<Failure, List<PokemonEntity>>(tListPokemonEntity));
    // act
    final result = await usecase(0);
    // Assert
    expect(result, const Right(tListPokemonEntity));
  });

  test('should return a ServerFailure when dont succeed', () async {
    // Arrange
    when(() => repository.getPokemons(0)).thenAnswer(
        (_) async => Left<Failure, List<PokemonEntity>>(ServerFailure()));
    // act
    final result = await usecase(0);
    // Assert
    expect(result, Left(ServerFailure()));
    verify(() => repository.getPokemons(0)).called(1);
  });
}
