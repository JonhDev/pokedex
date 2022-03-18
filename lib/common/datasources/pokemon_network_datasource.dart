import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:pokedex/common/models/pokemon.dart';
import 'package:pokedex/common/models/pokemon_response.dart';

abstract class PokemonNetworkDataSource {
  Future<PokemonResponse> fetchPokemons(int offset);
  Future<Pokemon?> getPokemon(String idOrName);
}

class PokemonNetworkDataSourceImpl extends PokemonNetworkDataSource {
  PokemonNetworkDataSourceImpl({required Dio dio, required Logger logger})
      : _dio = dio,
        _logger = logger;

  final Dio _dio;
  final Logger _logger;

  @override
  Future<PokemonResponse> fetchPokemons(int offset) async {
    final response = await _dio.get('pokemon/?offset=$offset&limit=20');
    _logger.i(response.data.toString());
    return PokemonResponse.fromJson(response.data);
  }

  @override
  Future<Pokemon?> getPokemon(String idOrName) async {
    try {
      final endpoint = 'pokemon/$idOrName';
      _logger.w('getting pokemon -> $endpoint');
      final response = await _dio.get(endpoint);
      return Pokemon.fromJson(response.data);
    } on DioError catch (error) {
      if (error.response?.statusCode == 404) {
        return null;
      }
    }
    throw Exception('Algo paso al recuperar el pokemon, intenta de nuevo');
  }
}
