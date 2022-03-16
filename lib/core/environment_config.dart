class EnvironmentConfig {
  static const baseUrl = String.fromEnvironment('BASE_URL',
      defaultValue: 'https://pokeapi.co/api/v2/');
  static const imageBaseUrl = String.fromEnvironment('IMAGE_BASE_URL',
      defaultValue:
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork');
}
