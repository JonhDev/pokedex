import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pokedex/common/repositories/pokemon_repository.dart';
import 'package:pokedex/home/state/home_state.dart';

class HomeStateNotifier extends StateNotifier<HomeState> {
  HomeStateNotifier({required HomeState state, required this.repository})
      : super(state) {
    loadPokemon();
  }

  final PokemonRepository repository;

  Future<void> loadPokemon() async {
    state = state.copyWith(isLoading: true);
    final response = await repository.fetchPokemon();
    state = state.copyWith(isLoading: false, pokemon: response);
  }
}
