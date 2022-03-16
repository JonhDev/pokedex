import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pokedex/common/providers/datasources_providers.dart';
import 'package:pokedex/common/repositories/pokemon_repository.dart';

final pokemonRepositoryProvider = Provider<PokemonRepository>(((ref) {
  return PokemonRepositoryImpl(
      networkDataSource: ref.watch(pokemonNetworkDatasourceProvider));
}));
