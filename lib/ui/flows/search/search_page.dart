import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lottie/lottie.dart';
import 'package:pokedex/ui/flows/search/state/search_page_state.dart';
import 'package:pokedex/ui/flows/search/state/search_page_state_providers.dart';
import 'package:pokedex/ui/widgets/loading_shimmer_grid.dart';
import '../../../common/models/pokemon.dart';
import '../../theme/pokedex_colors.dart';
import '../../widgets/pokemon_grid.dart';

class SearchPage extends HookConsumerWidget {
  const SearchPage({Key? key}) : super(key: key);

  static const searchBarKey = 'SearchBar';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(searchPageStateProvider);
    final stateNotifier = ref.watch(searchPageStateProvider.notifier);
    final textController =
        useTextEditingController.fromValue(TextEditingValue.empty);

    useEffect(() {
      listener() {
        stateNotifier.updateTextToSearch(textController.text);
      }

      textController.addListener(listener);
      return () => textController.removeListener(listener);
    }, [textController]);

    return Scaffold(
        appBar: AppBar(
            automaticallyImplyLeading: false,
            title: Hero(
              tag: searchBarKey,
              child: Card(
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  child: TextField(
                      controller: textController,
                      decoration: InputDecoration(
                          prefixIcon: const Icon(
                            Icons.search,
                            color: PokedexColors.grayTextOnWhite,
                          ),
                          suffixIcon: IconButton(
                              icon: const Icon(
                                Icons.clear,
                                color: PokedexColors.grayTextOnWhite,
                              ),
                              onPressed: () => textController.text = ''),
                          hintText: 'Buscar por nombre',
                          border: InputBorder.none))),
            ),
            backgroundColor: PokedexColors.primary,
            flexibleSpace: Container(
              alignment: Alignment.bottomRight,
              child: const Image(
                image: AssetImage('assets/pokeball.png'),
                width: 100,
                height: 100,
                fit: BoxFit.fitWidth,
                alignment: Alignment.topCenter,
                color: PokedexColors.secondary,
              ),
            )),
        body: Container(
          padding: const EdgeInsets.only(left: 16, right: 16),
          child: _buildContentPage(state),
        ));
  }

  Widget _buildContentPage(SearchPageState state) {
    switch (state.state) {
      case SearchState.loading:
        return _buildLoading();
      case SearchState.emptyContent:
        return _buildEmptyContent();
      case SearchState.emptySearch:
        return _buildEmptySearch();
      case SearchState.success:
        return _buildContent(state.pokemonList);
      default:
        return _buildError();
    }
  }

  Widget _buildEmptyContent() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        LottieBuilder.asset('assets/lotties/squirtle_hello.json',
            height: 200, width: 200),
        const Text(
          'Hora de buscar\nescribe para comenzar',
          textAlign: TextAlign.center,
          style: TextStyle(
              color: PokedexColors.grayTextOnWhite,
              fontWeight: FontWeight.bold),
        )
      ],
    );
  }

  Widget _buildEmptySearch() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        LottieBuilder.asset('assets/lotties/pikachu-finder.json',
            height: 200, width: 200),
        const Text(
          'No encontramos a tu pokemon',
          textAlign: TextAlign.center,
          style: TextStyle(
              color: PokedexColors.grayTextOnWhite,
              fontWeight: FontWeight.bold),
        )
      ],
    );
  }

  Widget _buildLoading() {
    return const LoadingShimmerGrid();
  }

  Widget _buildContent(List<Pokemon> pokemon) {
    return PokemonGrid(pokemon,
        padding: const EdgeInsets.only(bottom: 8, top: 16));
  }

  Widget _buildError() {
    return Center(
        child: Lottie.network(
            'https://assets10.lottiefiles.com/private_files/lf30_chkimb7d.json',
            height: 200,
            width: 200,
            repeat: false));
  }
}
