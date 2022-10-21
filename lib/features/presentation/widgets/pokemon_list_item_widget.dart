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
        height: double.infinity,
        width: 300,
        child: Card(
          semanticContainer: true,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          elevation: 5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          margin: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.network(imageUrl),
              const SizedBox(
                height: 8,
              ),
              Text(pokemonName.toUpperCase()),
            ],
          ),
        ),
      ),
    );
  }
}
