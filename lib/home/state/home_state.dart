import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pokedex/common/models/pokemon.dart';

part 'home_state.freezed.dart';

@Freezed()
class HomeState with _$HomeState {
  const factory HomeState(
      {@Default(true) bool isLoading,
      @Default(<Pokemon>[]) List<Pokemon> pokemon}) = _HomeState;
}
