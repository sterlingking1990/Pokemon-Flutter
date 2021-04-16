import 'package:pokemon_app/model/icons.dart';
import 'package:pokemon_app/model/ultra-sun-ultra-moon.dart';

class Generationvii {
  Icons icons;
  Ultrasunultramoon ultrasunultramoon;

  Generationvii.fromJson(Map<String, dynamic> json)
      : icons = Icons.fromJson(json['icons']),
        ultrasunultramoon =
            Ultrasunultramoon.fromJson(json['ultra-sun-ultra-moon']);

  Map<String, dynamic> toJson() => {
        'icons': this.icons?.toJson(),
        'ultra-sun-ultra-moon': this.ultrasunultramoon?.toJson(),
      };
}
