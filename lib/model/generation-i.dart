import 'package:pokemon_app/model/red-blue.dart';
import 'package:pokemon_app/model/yellow.dart';

class Generationi {
  Redblue redblue;
  Yellow yellow;

  Generationi.fromJson(Map<String, dynamic> json)
      : redblue = Redblue.fromJson(json['red-blue']),
        yellow = Yellow.fromJson(json['yellow']);

  Map<String, dynamic> toJson() => {
        'red-blue': this.redblue?.toJson(),
        'yellow': this.yellow?.toJson(),
      };
}
