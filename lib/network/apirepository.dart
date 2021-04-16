import 'package:pokemon_app/model/PokemonBaseResponse.dart';
import 'package:pokemon_app/model/SinglePokemonResponse.dart';

import 'apiprovider.dart';

class PokemonApiRepository {
  PokemonApiProvider pokemonApiProvider = PokemonApiProvider();

  Future<PokemonBaseResponse> getAllPokemonCharacter() {
    return pokemonApiProvider.getAllPokemon();
  }

  Future<SinglePokemonResponse> getPokemonCharacter(String pokemon) {
    return pokemonApiProvider.getParticularPokemon(pokemon);
  }
}
