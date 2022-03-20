import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pokedex/common/providers/repositories_providers.dart';
import 'package:pokedex/ui/flows/search/state/search_page_state.dart';
import 'package:pokedex/ui/flows/search/state/search_page_state_notifier.dart';

final searchPageStateProvider =
    StateNotifierProvider.autoDispose<SearchPageStateNotifier, SearchPageState>(
        (ref) => SearchPageStateNotifier(
            repository: ref.watch(pokemonRepositoryProvider),
            state: const SearchPageState()));
