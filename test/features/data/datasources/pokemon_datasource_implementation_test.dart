import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:mocktail/mocktail.dart';
import 'package:poke_api_teste/core/errors/exceptions.dart';
import 'package:poke_api_teste/core/http_client/http_client.dart';
import 'package:poke_api_teste/features/data/datasources/pokemon_datasource.dart';
import 'package:poke_api_teste/features/data/datasources/pokemon_datasource_implementation.dart';

import '../../../mocks/http_client_mock.dart';
import '../../../mocks/jsons_mocks/pokemon_json_mock.dart';
import '../../../mocks/models_mocks/pokemon_model_mock.dart';

void main() {
  late PokemonDatasource datasource;
  late HttpClient client;

  setUp(() {
    client = HttpClientMock();
    datasource = PokemonDatasourceImplementation(client);
  });

  test('should return a list of PokemonModel when is successful', () async {
    // Arrange
    when(() => client.get(any()))
        .thenAnswer((_) async => Response(listPokemonsJsonMock, 200));
    // act
    final result = await datasource.getPokemons(0, limit: 1);
    // Assert
    expect(result, tListPokemonModel);
  });

  test('should return a ServerException when not successful', () {
    // Arrange
    when(() => client.get(any()))
        .thenAnswer((_) async => Response('Something went wrong', 400));
    // act
    final result = datasource.getPokemons(0, limit: 1);
    // Assert
    expect(() => result, throwsA(ServerException()));
  });
}
