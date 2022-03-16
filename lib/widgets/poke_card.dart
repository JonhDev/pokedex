import 'package:flutter/material.dart';
import 'package:pokedex/common/models/pokemon.dart';
import 'package:pokedex/core/environment_config.dart';
import 'package:pokedex/utils/string_extensions.dart';

class PokeCard extends StatelessWidget {
  const PokeCard(this.pokemon, {Key? key}) : super(key: key);

  final Pokemon pokemon;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Column(
        children: [
          Flexible(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Image(
                  image: NetworkImage(
                      '${EnvironmentConfig.imageBaseUrl}${_getPokemonId()}.png')),
            ),
            flex: 1,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(8, 10, 8, 10),
            child: Text(pokemon.name.capitalize(),
                style: const TextStyle(fontWeight: FontWeight.bold)),
          )
        ],
      ),
    );
  }

  String _getPokemonId() {
    final regex = RegExp(r'\/\d+');
    return regex.firstMatch(pokemon.url)?.group(0) ?? "";
  }
}
