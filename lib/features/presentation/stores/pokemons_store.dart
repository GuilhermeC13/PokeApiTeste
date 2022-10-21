import 'package:dartz/dartz.dart';
import 'package:mobx/mobx.dart';
import 'package:poke_api_teste/core/errors/failures.dart';
import 'package:poke_api_teste/features/domain/entities/pokemon_entity.dart';
import 'package:poke_api_teste/features/domain/usecases/get_pokemons_usecase.dart';

part 'pokemons_store.g.dart';

class PokemonsStore = _PokemonsStoreBase with _$PokemonsStore;

abstract class _PokemonsStoreBase with Store {
  final GetPokemonsUsecase usecase;

  _PokemonsStoreBase(this.usecase);

  ObservableFuture<Either<Failure, List<PokemonEntity>>>? pokemonsEntityFuture;

  Either<Failure, List<PokemonEntity>>? pokemonsAnswer;

  // retorna uma lista de pokemons
  @action
  Future<List<PokemonEntity>> getPokemons(int offSet) async {
    List<PokemonEntity> pokemons = [];

    pokemonsEntityFuture = ObservableFuture(usecase(offSet));

    pokemonsAnswer = await pokemonsEntityFuture;

    pokemonsAnswer!.fold((error) => ServerFailure(), (success) {
      offSet = offSet + 20;
      pokemons.addAll(success);
    });

    return pokemons;
  }
}
