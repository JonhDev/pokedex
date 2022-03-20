import 'package:pokedex/common/datasources/pokemon_network_datasource.dart';
import 'package:pokedex/common/models/pokemon.dart';

abstract class PokemonRepository {
  Future<List<Pokemon>> fetchPokemon(int offset);
  Future<Pokemon?> getPokemon(String idOrName);
}

class PokemonRepositoryImpl extends PokemonRepository {
  PokemonRepositoryImpl({required PokemonNetworkDataSource networkDataSource})
      : _networkDataSource = networkDataSource;

  final PokemonNetworkDataSource _networkDataSource;

  @override
  Future<List<Pokemon>> fetchPokemon(int offset) async {
    final response = await _networkDataSource.fetchPokemons(offset);
    return response.results;
  }

  @override
  Future<Pokemon?> getPokemon(String idOrName) async {
    final response =
        await _networkDataSource.getPokemon(idOrName.toLowerCase());
    return response;
  }
}
