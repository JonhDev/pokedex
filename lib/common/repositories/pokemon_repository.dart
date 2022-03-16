import 'package:pokedex/common/datasources/pokemon_network_datasource.dart';
import 'package:pokedex/common/models/pokemon.dart';

abstract class PokemonRepository {
  Future<List<Pokemon>> fetchPokemon();
}

class PokemonRepositoryImpl extends PokemonRepository {
  PokemonRepositoryImpl({required PokemonNetworkDataSource networkDataSource})
      : _networkDataSource = networkDataSource;

  final PokemonNetworkDataSource _networkDataSource;

  @override
  Future<List<Pokemon>> fetchPokemon() async {
    final response = await _networkDataSource.fetchPokemons();
    return response.results;
  }
}
