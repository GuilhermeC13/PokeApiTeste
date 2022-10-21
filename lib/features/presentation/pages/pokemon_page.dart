import 'package:flutter/material.dart';
import 'package:poke_api_teste/core/utils/text_utils.dart';
import 'package:poke_api_teste/features/domain/entities/pokemon_entity.dart';
import 'package:poke_api_teste/features/presentation/widgets/stat_row_widget.dart';

class PokemonPage extends StatelessWidget {
  final PokemonEntity pokemon;

  const PokemonPage({Key? key, required this.pokemon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    /*
      Percentuais utilizados nas barras de vida, ataque e defesa
      Pesquisei o hp, ataque e defesa maximo de um pokemon
    */

    double hpPercent =
        pokemon.stats!.where((element) => element.name == 'hp').first.baseStat /
            255;
    double ataquePercent = pokemon.stats!
            .where((element) => element.name == 'attack')
            .first
            .baseStat /
        190;
    double defesaPercent = pokemon.stats!
            .where((element) => element.name == 'defense')
            .first
            .baseStat /
        230;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        centerTitle: true,
        title: Text(pokemon.name.toUpperCase()),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
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
                Text(
                  'Peso: ${pokemon.weight} kg',
                  style: textTitleStyleDark,
                ),
                Text(
                  'Altura: ${pokemon.height} m',
                  style: textTitleStyleDark,
                ),
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            const Text(
              'Stats',
              style: textTitleStyleDark,
            ),
            const SizedBox(
              height: 16,
            ),
            StatRowWidget(
              statName: 'HP',
              statValue: pokemon.stats!
                  .where((element) => element.name == 'hp')
                  .first
                  .baseStat
                  .toString(),
              statPercent: hpPercent,
              statColor: Colors.green,
            ),
            StatRowWidget(
              statName: 'Ataque',
              statValue: pokemon.stats!
                  .where((element) => element.name == 'attack')
                  .first
                  .baseStat
                  .toString(),
              statPercent: ataquePercent,
              statColor: Colors.red,
            ),
            StatRowWidget(
              statName: 'Defesa',
              statValue: pokemon.stats!
                  .where((element) => element.name == 'defense')
                  .first
                  .baseStat
                  .toString(),
              statPercent: defesaPercent,
              statColor: Colors.blue,
            ),
            const SizedBox(
              height: 16,
            ),
            const Text('Habilidades: ', style: textTitleStyleDark),
            const SizedBox(
              height: 8,
            ),
            Flexible(
              child: ListView.builder(
                itemBuilder: (context, index) => SizedBox(
                  width: 120,
                  child: Text(pokemon.abilities[index].toUpperCase(),
                      style: textStatsStyleDark),
                ),
                itemCount: pokemon.abilities.length,
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
