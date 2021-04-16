import 'package:pokemon_app/model/omegaruby-alphasapphire.dart';
import 'package:pokemon_app/model/x-y.dart';

class Generationvi {
  Omegarubyalphasapphire omegarubyalphasapphire;
  Xy xy;

  Generationvi.fromJson(Map<String, dynamic> json)
      : omegarubyalphasapphire =
            Omegarubyalphasapphire.fromJson(json['omegaruby-alphasapphire']),
        xy = Xy.fromJson(json['x-y']);

  Map<String, dynamic> toJson() => {
        'omegaruby-alphasapphire': this.omegarubyalphasapphire?.toJson(),
        'x-y': this.xy?.toJson(),
      };
}
