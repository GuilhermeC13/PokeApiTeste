import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:poke_api_teste/core/errors/exceptions.dart';
import 'package:poke_api_teste/core/errors/failures.dart';
import 'package:poke_api_teste/features/data/datasources/pokemon_datasource.dart';
import 'package:poke_api_teste/features/data/repositories/pokemon_repository_implementation.dart';

import '../../../mocks/datasource_mocks/pokemon_datasource_model.dart';
import '../../../mocks/models_mocks/pokemon_model_mock.dart';
import '../../../mocks/pokemon_entity_mock.dart';

void main() {
  late PokemonRepositoryImplementation repositoryImplementation;
  late PokemonDatasource datasource;

  setUp(() {
    datasource = PokemonDatasourceMock();
    repositoryImplementation = PokemonRepositoryImplementation(datasource);
  });

  test(
      'should return a list of Pokemon Model when calls the GetPokemons datasource',
      () async {
    // Arrange
    when(() => datasource.getPokemons(0, limit: 1))
        .thenAnswer((_) async => tListPokemonModel);
    // act
    final result = await repositoryImplementation.getPokemons(0, limit: 1);
    // Assert
    expect(result, const Right(tListPokemonModel));
  });

  test('should return a ServerFailure when the call to datasource dont succeed',
      () async {
    // Arrange
    when(() => datasource.getPokemons(0)).thenThrow(ServerException());
    // act
    final result = await repositoryImplementation.getPokemons(0);
    // Assert
    expect(result, Left(ServerFailure()));
  });
}
