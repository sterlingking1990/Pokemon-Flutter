import 'package:pokemon_app/model/PokemonBaseResponse.dart';
import 'package:pokemon_app/network/apirepository.dart';
import 'package:rxdart/rxdart.dart';

class PokemonAppStateManagement {
  final PokemonApiRepository pokemonApiRepository = PokemonApiRepository();
  final BehaviorSubject<PokemonBaseResponse> _pokemonDataState =
      BehaviorSubject();

  getPokemonCharacters() async {
    PokemonBaseResponse pokemonBaseResponse =
        await pokemonApiRepository.getAllPokemonCharacter();
    _pokemonDataState.sink.add(pokemonBaseResponse);
  }

  dispose() {
    _pokemonDataState.close();
  }

  BehaviorSubject<PokemonBaseResponse> get pokemonDataStateObservable =>
      _pokemonDataState.stream;
}

final pokemonAppState = PokemonAppStateManagement();
