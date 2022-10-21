import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:mobx/mobx.dart';
import 'package:poke_api_teste/features/domain/entities/pokemon_entity.dart';
import 'package:poke_api_teste/features/presentation/pages/pokemon_page.dart';
import 'package:poke_api_teste/features/presentation/stores/pokemons_store.dart';
import 'package:poke_api_teste/features/presentation/widgets/pokemon_list_item_widget.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  PokemonsStore store = GetIt.I.get<PokemonsStore>();

  final PagingController<int, PokemonEntity> _pagingController =
      PagingController(firstPageKey: 0);

  ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    _loadInitialPokemons();
    _pagingController.addPageRequestListener((pageKey) {
      _fetchPage(pageKey);
    });
    super.initState();
  }

  _loadInitialPokemons() async {
    final initialPokemons = await store.getPokemons(0);
    _pagingController.appendPage(initialPokemons, 0);
  }

  Future<void> _fetchPage(int pageKey) async {
    try {
      final newItems = await store.getPokemons(pageKey + 20);
      final isLastPage = newItems.length < 20;
      if (isLastPage) {
        _pagingController.appendLastPage(newItems);
      } else {
        final nextPageKey = pageKey + newItems.length;
        _pagingController.appendPage(newItems, nextPageKey);
      }
    } catch (error) {
      _pagingController.error = error;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: const Center(
            child: Text(
          'Pokemons',
        )),
      ),
      body: Observer(builder: (_) {
        return store.pokemonsEntityFuture!.status == FutureStatus.fulfilled
            ? PagedGridView<int, PokemonEntity>(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: 100 / 150,
                  crossAxisSpacing: 5,
                  mainAxisSpacing: 0,
                  crossAxisCount: 2,
                ),
                pagingController: _pagingController,
                builderDelegate: PagedChildBuilderDelegate<PokemonEntity>(
                  itemBuilder: (context, item, index) => InkWell(
                    onTap: () => Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: ((context) => PokemonPage(pokemon: item)),
                      ),
                    ),
                    child: PokemonListItemWidget(
                      imageUrl: item.sprites!.officialArtwork!.frontDefault,
                      pokemonName: item.name,
                    ),
                  ),
                ),
              )
            : const Center(
                child: CircularProgressIndicator(),
              );
      }),
    );
  }
}
