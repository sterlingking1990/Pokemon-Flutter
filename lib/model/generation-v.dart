import 'package:pokemon_app/model/black-white.dart';

class Generationv {
  Blackwhite blackwhite;

  Generationv.fromJson(Map<String, dynamic> json)
      : blackwhite = Blackwhite.fromJson(json['black-white']);

  Map<String, dynamic> toJson() => {
        'black-white': this.blackwhite?.toJson(),
      };
}
