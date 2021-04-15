import 'package:pokemon_app/model/results.dart';

class PokemonBaseResponse {
  int count;
  String next;
  Object previous;
  List<Results> results;
  String error;

  PokemonBaseResponse(this.results, this.error);

  PokemonBaseResponse.fromJson(Map<String, dynamic> json)
      : count = json['count'],
        next = json['next'],
        previous = json['previous'],
        results = List<Results>.from(
          json['results'].map((e) => Results.fromJson(e)),
        );

  Map<String, dynamic> toJson() => {
        'count': this.count,
        'next': this.next,
        'previous': this.previous,
        'results': this.results?.map((e) => e.toJson())?.toList(),
      };

  PokemonBaseResponse.withError(String error)
      : results = [],
        this.error = error;
}
