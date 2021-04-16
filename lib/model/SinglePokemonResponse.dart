import 'package:pokemon_app/model/abilities.dart';
import 'package:pokemon_app/model/forms.dart';
import 'package:pokemon_app/model/game_indices.dart';
import 'package:pokemon_app/model/moves.dart';
import 'package:pokemon_app/model/species.dart';
import 'package:pokemon_app/model/sprites.dart';
import 'package:pokemon_app/model/stats.dart';
import 'package:pokemon_app/model/types.dart';

class SinglePokemonResponse {
  List<Abilities> abilities;
  int baseExperience;
  List<Forms> forms;
  List<GameIndices> gameIndices;
  int height;
  List<Object> heldItems;
  int id;
  bool isDefault;
  String locationAreaEncounters;
  List<Moves> moves;
  String name;
  int order;
  List<Object> pastTypes;
  Species species;
  Sprites sprites;
  List<Stats> stats;
  List<Types> types;
  int weight;
  String error;

  SinglePokemonResponse(this.abilities, this.error);

  SinglePokemonResponse.fromJson(Map<String, dynamic> json)
      : abilities = List<Abilities>.from(
          json['abilities'].map((e) => Abilities.fromJson(e)),
        ),
        baseExperience = json['base_experience'],
        forms = List<Forms>.from(
          json['forms'].map((e) => Forms.fromJson(e)),
        ),
        gameIndices = List<GameIndices>.from(
          json['game_indices'].map((e) => GameIndices.fromJson(e)),
        ),
        height = json['height'],
        heldItems = json['held_items'],
        id = json['id'],
        isDefault = json['is_default'],
        locationAreaEncounters = json['location_area_encounters'],
        moves = List<Moves>.from(
          json['moves'].map((e) => Moves.fromJson(e)),
        ),
        name = json['name'],
        order = json['order'],
        pastTypes = json['past_types'],
        species = Species.fromJson(json['species']),
        sprites = Sprites.fromJson(json['sprites']),
        stats = List<Stats>.from(
          json['stats'].map((e) => Stats.fromJson(e)),
        ),
        types = List<Types>.from(
          json['types'].map((e) => Types.fromJson(e)),
        ),
        weight = json['weight'],
        error = "";

  Map<String, dynamic> toJson() => {
        'abilities': this.abilities?.map((e) => e.toJson())?.toList(),
        'base_experience': this.baseExperience,
        'forms': this.forms?.map((e) => e.toJson())?.toList(),
        'game_indices': this.gameIndices?.map((e) => e.toJson())?.toList(),
        'height': this.height,
        'held_items': this.heldItems,
        'id': this.id,
        'is_default': this.isDefault,
        'location_area_encounters': this.locationAreaEncounters,
        'moves': this.moves?.map((e) => e.toJson())?.toList(),
        'name': this.name,
        'order': this.order,
        'past_types': this.pastTypes,
        'species': this.species?.toJson(),
        'sprites': this.sprites?.toJson(),
        'stats': this.stats?.map((e) => e.toJson())?.toList(),
        'types': this.types?.map((e) => e.toJson())?.toList(),
        'weight': this.weight,
        'error': this.error,
      };

  SinglePokemonResponse.withError(String error)
      : abilities = [],
        this.error = error;
}
