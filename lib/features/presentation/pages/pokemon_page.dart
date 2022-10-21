import 'package:flutter/material.dart';
import 'package:poke_api_teste/features/domain/entities/pokemon_entity.dart';

class PokemonPage extends StatelessWidget {
  final PokemonEntity pokemon;

  const PokemonPage({Key? key, required this.pokemon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        centerTitle: true,
        title: Text(pokemon.name.toUpperCase()),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 200,
            width: 400,
            child: Image.network(pokemon.sprites!.home!.frontDefault!),
          ),
          const SizedBox(
            height: 32,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text('Peso: ${pokemon.weight} kg'),
              Text('Altura: ${pokemon.height} m'),
            ],
          ),
          const SizedBox(
            height: 16,
          ),
          const Text('Stats: '),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                  'HP: ${pokemon.stats!.where((element) => element.name == 'hp').first.baseStat}'),
              Text(
                  'Ataque: ${pokemon.stats!.where((element) => element.name == 'attack').first.baseStat}'),
              Text(
                  'Defesa: ${pokemon.stats!.where((element) => element.name == 'defense').first.baseStat}'),
            ],
          ),
          const SizedBox(
            height: 16,
          ),
          const Text('Habilidades: '),
          const SizedBox(
            height: 8,
          ),
          Flexible(
            child: ListView.builder(
              itemBuilder: (context, index) => SizedBox(
                  width: 100,
                  child: Text(pokemon.abilities[index].toUpperCase())),
              itemCount: pokemon.abilities.length,
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
            ),
          ),
        ],
      ),
    );
  }
}
