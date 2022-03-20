import 'package:flutter/material.dart';
import 'package:pokedex/common/models/pokemon.dart';
import '../theme/pokedex_colors.dart';
import 'poke_card.dart';

class PokemonGrid extends StatelessWidget {
  const PokemonGrid(this.pokemonList,
      {this.showLoadingNextPage = false,
      this.controller,
      Key? key,
      this.padding = const EdgeInsets.all(0)})
      : super(key: key);

  final List<Pokemon> pokemonList;
  final ScrollController? controller;
  final bool showLoadingNextPage;
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
        slivers: [
          SliverPadding(
              padding: padding,
              sliver: SliverGrid(
                  delegate: SliverChildBuilderDelegate((context, index) {
                    return PokeCard(pokemonList[index]);
                  }, childCount: pokemonList.length),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      mainAxisExtent: 220,
                      crossAxisSpacing: 16,
                      mainAxisSpacing: 10,
                      crossAxisCount: 2))),
          SliverToBoxAdapter(child: _buildLoadingWidget(showLoadingNextPage))
        ],
        shrinkWrap: true,
        physics: const ClampingScrollPhysics(),
        controller: controller);
  }

  Widget? _buildLoadingWidget(bool show) {
    if (show) {
      return const Center(
        child: CircularProgressIndicator(color: PokedexColors.primary),
      );
    }
    return null;
  }
}
