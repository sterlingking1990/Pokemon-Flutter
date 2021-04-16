import 'package:dio/dio.dart';
import 'package:pokemon_app/model/PokemonBaseResponse.dart';
import 'package:pokemon_app/model/SinglePokemonResponse.dart';

class PokemonApiProvider {
  final Dio _dio = Dio();
  final _endpoint = "https://pokeapi.co/api/v2/pokemon";

  final _endpointPokemonSearchByName = "https://pokeapi.co/api/v2/pokemon/";

  Future<PokemonBaseResponse> getAllPokemon() async {
    try {
      Response response = await _dio.get(_endpoint);
      return PokemonBaseResponse.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception occured : $error stackTrace:$stacktrace");
      PokemonBaseResponse.withError(_handleError(error));
    }
  }

  Future<SinglePokemonResponse> getParticularPokemon(String pokemonName) async {
    try {
      Response response =
          await _dio.get(_endpointPokemonSearchByName + pokemonName);
      return SinglePokemonResponse.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception occured : $error stackTrace:$stacktrace");
      SinglePokemonResponse.withError(_handleError(error));
    }
  }

  String _handleError(DioError error) {
    String errorDescription = "";
    if (error is DioError) {
      DioError dioError = error;
      switch (dioError.type) {
        case DioErrorType.cancel:
          errorDescription = "Request to API Server was cancelled";
          break;
        case DioErrorType.connectTimeout:
          errorDescription = "Connection timeout with API Server";
          break;
        case DioErrorType.other:
          errorDescription =
              "Connection to API Server failed due to internet connection";
          break;
        case DioErrorType.receiveTimeout:
          errorDescription = "Receive timeout in connection with API Server";
          break;
        case DioErrorType.response:
          errorDescription =
              "Received invalid status code: ${dioError.response.statusCode}";
          break;
        case DioErrorType.sendTimeout:
          errorDescription = "Send timeout in connection with API Server";
          break;
      }
    } else {
      errorDescription = "Unexception error occured";
    }
    return errorDescription;
  }
}
