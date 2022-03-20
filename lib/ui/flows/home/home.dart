import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pokedex/common/providers/loggers_providers.dart';
import 'package:pokedex/routing/router.dart';
import 'package:pokedex/routing/routes.dart';
import 'package:pokedex/ui/theme/pokedex_colors.dart';
import 'package:pokedex/ui/widgets/poke_app_bar.dart';
import 'package:pokedex/ui/widgets/pokemon_grid.dart';
import 'package:pokedex/ui/widgets/static_searchbar.dart';
import '../../widgets/loading_shimmer_grid.dart';
import '../search/search_page.dart';
import 'state/home_state.dart';
import 'state/home_state_provider.dart';

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
    final router = ref.watch(routerProvider);

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
          child: Hero(
            tag: SearchPage.searchBarKey,
            child: StaticSearchBar(
              homeState.showSearchBar
                  ? PokedexColors.grayTextOnWhite
                  : Colors.white,
              onTap: () => router.navigateTo(context, Routes.search),
            ),
          )),
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
      return PokemonGrid(homeState.pokemon,
          showLoadingNextPage: homeState.isLoadingNextPage,
          controller: controller,
          padding: const EdgeInsets.only(bottom: 8));
    }
  }
}
