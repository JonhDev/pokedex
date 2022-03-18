import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pokedex/common/providers/repositories_providers.dart';
import 'home_state.dart';
import 'home_state_notifier.dart';

final homeStateProvider =
    StateNotifierProvider.autoDispose<HomeStateNotifier, HomeState>(((ref) {
  return HomeStateNotifier(
      state: const HomeState(),
      repository: ref.watch(pokemonRepositoryProvider));
}));
