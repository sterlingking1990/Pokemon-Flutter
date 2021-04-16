import 'package:pokemon_app/model/dream_world.dart';
import 'package:pokemon_app/model/official-artwork.dart';

class Other {
  DreamWorld dreamWorld;
  Officialartwork officialartwork;

  Other.fromJson(Map<String, dynamic> json)
      : dreamWorld = DreamWorld.fromJson(json['dream_world']),
        officialartwork = Officialartwork.fromJson(json['official-artwork']);

  Map<String, dynamic> toJson() => {
        'dream_world': this.dreamWorld?.toJson(),
        'official-artwork': this.officialartwork?.toJson(),
      };
}
