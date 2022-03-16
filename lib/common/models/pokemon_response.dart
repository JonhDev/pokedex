import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pokedex/common/models/pokemon.dart';

part 'pokemon_response.freezed.dart';
part 'pokemon_response.g.dart';

@Freezed()
class PokemonResponse with _$PokemonResponse {
  const factory PokemonResponse(
      {required int count,
      required String? next,
      required String? previous,
      required List<Pokemon> results}) = _PokemonResponse;

  factory PokemonResponse.fromJson(Map<String, dynamic> json) =>
      _$PokemonResponseFromJson(json);
}
