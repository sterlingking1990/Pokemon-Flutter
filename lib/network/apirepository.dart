import 'package:pokemon_app/model/PokemonBaseResponse.dart';

import 'apiprovider.dart';

class PokemonApiRepository {
  PokemonApiProvider pokemonApiProvider = PokemonApiProvider();

  Future<PokemonBaseResponse> getAllPokemonCharacter() {
    return pokemonApiProvider.getAllPokemon();
  }
}
