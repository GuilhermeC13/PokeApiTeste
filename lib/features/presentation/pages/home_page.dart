import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'package:poke_api_teste/features/domain/entities/pokemon_entity.dart';
import 'package:poke_api_teste/features/presentation/stores/pokemons_store.dart';

class HomePage extends StatelessWidget {
  PokemonsStore store = GetIt.I.get<PokemonsStore>();

  HomePage({super.key}) {
    store.getPokemons();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      return store.pokemonsEntityFuture!.status == FutureStatus.fulfilled
          ? ListView.builder(
              itemCount: store.pokemons.length + (store.isLastPage ? 0 : 1),
              itemBuilder: (context, index) {
                if (index == store.pokemons.length - 3) {
                  store.getPokemons();
                }
                if (index == store.pokemons.length) {
                  if (store.error) {
                    //todo dialog de error
                    return const Center(child: Text('Error'));
                  } else {
                    return const Center(
                        child: Padding(
                      padding: EdgeInsets.all(8),
                      child: CircularProgressIndicator(),
                    ));
                  }
                }
                final PokemonEntity pokemon = store.pokemons[index];
                return Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: SizedBox(
                    height: 100,
                    width: 300,
                    child: Image.network(
                        pokemon.sprites!.officialArtwork!.frontDefault),
                  ),
                );
              })
          : const Center(
              child: CircularProgressIndicator(),
            );
    });
  }
}
