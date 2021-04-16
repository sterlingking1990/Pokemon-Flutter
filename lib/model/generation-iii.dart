import 'package:pokemon_app/model/emerald.dart';
import 'package:pokemon_app/model/firered-leafgreen.dart';
import 'package:pokemon_app/model/ruby-sapphire.dart';

class Generationiii {
  Emerald emerald;
  Fireredleafgreen fireredleafgreen;
  Rubysapphire rubysapphire;

  Generationiii.fromJson(Map<String, dynamic> json)
      : emerald = Emerald.fromJson(json['emerald']),
        fireredleafgreen = Fireredleafgreen.fromJson(json['firered-leafgreen']),
        rubysapphire = Rubysapphire.fromJson(json['ruby-sapphire']);

  Map<String, dynamic> toJson() => {
        'emerald': this.emerald?.toJson(),
        'firered-leafgreen': this.fireredleafgreen?.toJson(),
        'ruby-sapphire': this.rubysapphire?.toJson(),
      };
}
