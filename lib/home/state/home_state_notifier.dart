import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pokedex/common/repositories/pokemon_repository.dart';
import 'package:pokedex/home/state/home_state.dart';

class HomeStateNotifier extends StateNotifier<HomeState> {
  HomeStateNotifier({required HomeState state, required this.repository})
      : super(state) {
    loadInitialPokemon();
  }

  final PokemonRepository repository;
  final int limit = 20;
  int _pageOffset = 0;

  Future<void> loadInitialPokemon() async {
    state = state.copyWith(isLoading: true);
    final response = await repository.fetchPokemon(_pageOffset);
    state = state.copyWith(isLoading: false, pokemon: response);
  }

  Future<void> loadNextPage() async {
    _pageOffset += 20;
    state = state.copyWith(isLoadingNextPage: true);
    final response = await repository.fetchPokemon(_pageOffset);
    state.pokemon.addAll(response);
    state = state.copyWith(isLoadingNextPage: false);
  }
}
