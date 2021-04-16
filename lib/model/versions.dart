import 'package:pokemon_app/model/generation-i.dart';
import 'package:pokemon_app/model/generation-ii.dart';
import 'package:pokemon_app/model/generation-iii.dart';
import 'package:pokemon_app/model/generation-iv.dart';
import 'package:pokemon_app/model/generation-v.dart';
import 'package:pokemon_app/model/generation-vi.dart';
import 'package:pokemon_app/model/generation-vii.dart';
import 'package:pokemon_app/model/generation-viii.dart';

class Versions {
  Generationi generationi;
  Generationii generationii;
  Generationiii generationiii;
  Generationiv generationiv;
  Generationv generationv;
  Generationvi generationvi;
  Generationvii generationvii;
  Generationviii generationviii;

  Versions.fromJson(Map<String, dynamic> json)
      : generationi = Generationi.fromJson(json['generation-i']),
        generationii = Generationii.fromJson(json['generation-ii']),
        generationiii = Generationiii.fromJson(json['generation-iii']),
        generationiv = Generationiv.fromJson(json['generation-iv']),
        generationv = Generationv.fromJson(json['generation-v']),
        generationvi = Generationvi.fromJson(json['generation-vi']),
        generationvii = Generationvii.fromJson(json['generation-vii']),
        generationviii = Generationviii.fromJson(json['generation-viii']);

  Map<String, dynamic> toJson() => {
        'generation-i': this.generationi?.toJson(),
        'generation-ii': this.generationii?.toJson(),
        'generation-iii': this.generationiii?.toJson(),
        'generation-iv': this.generationiv?.toJson(),
        'generation-v': this.generationv?.toJson(),
        'generation-vi': this.generationvi?.toJson(),
        'generation-vii': this.generationvii?.toJson(),
        'generation-viii': this.generationviii?.toJson(),
      };
}
