import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:pokedex/common/models/pokemon_response.dart';

abstract class PokemonNetworkDataSource {
  Future<PokemonResponse> fetchPokemons(int offset);
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
}
