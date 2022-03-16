import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pokedex/home/state/home_state_provider.dart';
import 'package:pokedex/theme/pokedex_colors.dart';
import 'package:pokedex/widgets/poke_app_bar.dart';
import 'package:pokedex/widgets/poke_card.dart';

class HomePage extends HookWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PokeAppBar('Pokedex'),
      body: Container(
        padding: const EdgeInsets.only(left: 16, right: 16),
        child: const PokemonList(),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: PokedexColors.primary,
        child: const Image(image: AssetImage('assets/pokeball_color.png')),
        onPressed: () {},
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}

class PokemonList extends HookConsumerWidget {
  const PokemonList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final homeState = ref.watch(homeStateProvider);
    if (homeState.isLoading) {
      return const Center(
        child: CircularProgressIndicator(
          color: PokedexColors.secondary,
        ),
      );
    } else {
      return GridView.builder(
          padding: const EdgeInsets.only(top: 16, bottom: 16),
          shrinkWrap: true,
          physics: const ClampingScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              mainAxisExtent: 220,
              crossAxisSpacing: 16,
              mainAxisSpacing: 10,
              crossAxisCount: 2),
          itemCount: homeState.pokemon.length,
          itemBuilder: (BuildContext context, int index) {
            return PokeCard(homeState.pokemon[index]);
          });
    }
  }
}