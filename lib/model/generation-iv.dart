import 'package:pokemon_app/model/diamond-pearl.dart';
import 'package:pokemon_app/model/heartgold-soulsilver.dart';
import 'package:pokemon_app/model/platinum.dart';

class Generationiv {
  Diamondpearl diamondpearl;
  Heartgoldsoulsilver heartgoldsoulsilver;
  Platinum platinum;

  Generationiv.fromJson(Map<String, dynamic> json)
      : diamondpearl = Diamondpearl.fromJson(json['diamond-pearl']),
        heartgoldsoulsilver =
            Heartgoldsoulsilver.fromJson(json['heartgold-soulsilver']),
        platinum = Platinum.fromJson(json['platinum']);

  Map<String, dynamic> toJson() => {
        'diamond-pearl': this.diamondpearl?.toJson(),
        'heartgold-soulsilver': this.heartgoldsoulsilver?.toJson(),
        'platinum': this.platinum?.toJson(),
      };
}
