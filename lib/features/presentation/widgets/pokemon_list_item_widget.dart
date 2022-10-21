import 'package:flutter/material.dart';

class PokemonListItemWidget extends StatelessWidget {
  final String imageUrl;
  final String pokemonName;

  const PokemonListItemWidget({
    Key? key,
    required this.imageUrl,
    required this.pokemonName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        height: 100,
        width: 300,
        child: Column(
          children: [
            Image.network(imageUrl),
            const SizedBox(
              height: 8,
            ),
            Text(pokemonName.toUpperCase()),
          ],
        ),
      ),
    );
  }
}
