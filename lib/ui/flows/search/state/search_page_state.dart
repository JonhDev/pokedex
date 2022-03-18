import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pokedex/common/models/pokemon.dart';

part 'search_page_state.freezed.dart';

@Freezed()
class SearchPageState with _$SearchPageState {
  const factory SearchPageState(
      {@Default(SearchState.emptySearch) SearchState state,
      @Default('') String search,
      @Default(<Pokemon>[]) List<Pokemon> pokemonList}) = _SearchPageState;
}

enum SearchState { loading, emptySearch, emptyContent, success, error }
