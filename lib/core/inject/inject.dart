import 'package:get_it/get_it.dart';
import 'package:poke_api_teste/core/http_client/http_client.dart';
import 'package:poke_api_teste/core/http_client/http_client_implementation.dart';
import 'package:poke_api_teste/features/data/datasources/pokemon_datasource.dart';
import 'package:poke_api_teste/features/data/datasources/pokemon_datasource_implementation.dart';
import 'package:poke_api_teste/features/data/repositories/pokemon_repository_implementation.dart';
import 'package:poke_api_teste/features/domain/repositories/pokemon_repository.dart';
import 'package:poke_api_teste/features/domain/usecases/get_pokemons_usecase.dart';
import 'package:poke_api_teste/features/presentation/stores/pokemons_store.dart';

class Inject {
  static void init() {
    GetIt getIt = GetIt.instance;

    // Http
    getIt.registerLazySingleton<HttpClient>(() => HttpImplementation());
    // Datasources
    getIt.registerLazySingleton<PokemonDatasource>(
        () => PokemonDatasourceImplementation(getIt()));
    // Repositories
    getIt.registerLazySingleton<PokemonRepository>(
        () => PokemonRepositoryImplementation(getIt()));
    // Usecases
    getIt.registerSingleton<GetPokemonsUsecase>(GetPokemonsUsecase(getIt()));
    // Stores (Controllers)
    getIt.registerFactory<PokemonsStore>(() => PokemonsStore(getIt()));
  }
}
