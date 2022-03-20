import 'package:freezed_annotation/freezed_annotation.dart';

part 'pokemon.freezed.dart';
part 'pokemon.g.dart';

@Freezed()
class Pokemon with _$Pokemon {
  const factory Pokemon(
      {required String name,
      required String? url,
      @Default(0) int id}) = _Pokemon;

  factory Pokemon.fromJson(Map<String, dynamic> json) =>
      _$PokemonFromJson(json);
}
