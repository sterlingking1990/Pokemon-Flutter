import 'package:pokemon_app/model/PokemonBaseResponse.dart';
import 'package:pokemon_app/model/SinglePokemonResponse.dart';
import 'package:pokemon_app/network/apirepository.dart';
import 'package:rxdart/rxdart.dart';

class PokemonAppStateManagement {
  final PokemonApiRepository pokemonApiRepository = PokemonApiRepository();

  final BehaviorSubject<PokemonBaseResponse> _pokemonDataState =
      BehaviorSubject();


  final BehaviorSubject<SinglePokemonResponse> _singlePokemon =
  BehaviorSubject();

  getPokemonCharacters() async {
    PokemonBaseResponse pokemonBaseResponse =
        await pokemonApiRepository.getAllPokemonCharacter();
    _pokemonDataState.sink.add(pokemonBaseResponse);
  }

  getPokemon(String pokemonName) async {
    SinglePokemonResponse singlePokemonResponse = await pokemonApiRepository.getPokemonCharacter(pokemonName);
    _singlePokemon.sink.add(singlePokemonResponse);
  }

  dispose() {
    _pokemonDataState.close();
    _singlePokemon.close();
  }

  BehaviorSubject<PokemonBaseResponse> get pokemonDataStateObservable =>
      _pokemonDataState.stream;

  BehaviorSubject<SinglePokemonResponse> get singlePokemonCharacterObservable =>
      _singlePokemon.stream;
}

final pokemonAppState = PokemonAppStateManagement();
