import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pokedex/common/datasources/pokemon_network_datasource.dart';
import 'package:pokedex/common/providers/loggers_providers.dart';
import 'package:pokedex/core/dio_provider.dart';

final pokemonNetworkDatasourceProvider =
    Provider<PokemonNetworkDataSource>((ref) {
  return PokemonNetworkDataSourceImpl(
      dio: ref.watch(dioProvider), logger: ref.watch(loggerProvider));
});
