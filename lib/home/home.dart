import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pokedex/common/providers/loggers_providers.dart';
import 'package:pokedex/home/state/home_state.dart';
import 'package:pokedex/home/state/home_state_provider.dart';
import 'package:pokedex/theme/pokedex_colors.dart';
import 'package:pokedex/widgets/poke_app_bar.dart';
import 'package:pokedex/widgets/poke_card.dart';
import 'package:shimmer/shimmer.dart';

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
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}

class PokemonList extends HookConsumerWidget {
  const PokemonList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = useScrollController();
    final homeState = ref.watch(homeStateProvider);
    final homeStateNotifier = ref.watch(homeStateProvider.notifier);
    final logger = ref.watch(loggerProvider);

    useEffect(() {
      listener() {
        if (controller.offset >= controller.position.maxScrollExtent &&
            !controller.position.outOfRange) {
          logger.i('He llegado al final, cargando siguiente pagina...');
          homeStateNotifier.loadNextPage();
        }
        if (controller.position.userScrollDirection ==
            ScrollDirection.forward) {
          homeStateNotifier.switchSearchBarState(true);
        }
        if (controller.position.userScrollDirection ==
            ScrollDirection.reverse) {
          homeStateNotifier.switchSearchBarState(false);
        }
      }

      controller.addListener(listener);
      return () => controller.removeListener(listener);
    }, [controller]);

    return Column(children: [
      AnimatedContainer(
        duration: const Duration(milliseconds: 500),
        height: _getSearchBarSize(homeState.showSearchBar),
        child: Card(
          margin: const EdgeInsets.only(top: 16, bottom: 8),
          elevation: 0,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          color: PokedexColors.grayOnWhite,
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Row(children: [
              Icon(Icons.search,
                  color: homeState.showSearchBar
                      ? PokedexColors.grayTextOnWhite
                      : Colors.white),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'Buscar por nombre',
                  style: TextStyle(color: PokedexColors.grayTextOnWhite),
                ),
              )
            ]),
          ),
        ),
      ),
      Expanded(child: _buildContent(homeState, controller))
    ]);
  }

  double _getSearchBarSize(bool show) {
    if (show) {
      return 80;
    } else {
      return 0;
    }
  }

  Widget _buildContent(HomeState homeState, ScrollController controller) {
    if (homeState.isLoading) {
      return const LoadingShimmerGrid();
    } else {
      return CustomScrollView(
          slivers: [
            SliverPadding(
                padding: const EdgeInsets.only(bottom: 8),
                sliver: SliverGrid(
                    delegate: SliverChildBuilderDelegate((context, index) {
                      return PokeCard(homeState.pokemon[index]);
                    }, childCount: homeState.pokemon.length),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            mainAxisExtent: 220,
                            crossAxisSpacing: 16,
                            mainAxisSpacing: 10,
                            crossAxisCount: 2))),
            SliverToBoxAdapter(
                child: _buildLoadingWidget(homeState.isLoadingNextPage))
          ],
          shrinkWrap: true,
          physics: const ClampingScrollPhysics(),
          controller: controller);
    }
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

class LoadingShimmerGrid extends StatelessWidget {
  const LoadingShimmerGrid({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        padding: const EdgeInsets.only(top: 16, bottom: 16),
        shrinkWrap: true,
        physics: const ClampingScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            mainAxisExtent: 220,
            crossAxisSpacing: 16,
            mainAxisSpacing: 10,
            crossAxisCount: 2),
        itemCount: 6,
        itemBuilder: (BuildContext context, int index) {
          return Shimmer.fromColors(
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
              ),
              baseColor: Colors.grey[200]!,
              highlightColor: Colors.grey[500]!);
        });
  }
}
