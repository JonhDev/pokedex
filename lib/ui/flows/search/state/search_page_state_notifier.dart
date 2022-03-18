import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pokedex/ui/flows/search/state/search_page_state.dart';
import 'package:pokedex/utils/deboucer.dart';
import '../../../../common/repositories/pokemon_repository.dart';

class SearchPageStateNotifier extends StateNotifier<SearchPageState> {
  SearchPageStateNotifier({required SearchPageState state, required repository})
      : _repository = repository,
        super(state);

  final PokemonRepository _repository;

  final _debouncer = Debouncer(1000);

  void updateTextToSearch(String text) {
    if (text.isEmpty) {
      _debouncer.cancel();
      state = state.copyWith(state: SearchState.emptyContent);
    } else {
      _debouncer.run(() {
        _searchPokemon(text);
      });
    }
  }

  void _searchPokemon(String text) async {
    try {
      state = state.copyWith(state: SearchState.loading);
      final pokemon = await _repository.getPokemon(text);
      if (pokemon == null) {
        state = state.copyWith(state: SearchState.emptySearch);
      } else {
        state =
            state.copyWith(state: SearchState.success, pokemonList: [pokemon]);
      }
    } catch (ex) {
      state = state.copyWith(state: SearchState.error);
    }
  }
}
