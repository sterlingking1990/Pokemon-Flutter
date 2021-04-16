import 'package:pokemon_app/model/icons.dart';

class Generationviii {
  Icons icons;

  Generationviii.fromJson(Map<String, dynamic> json)
      : icons = Icons.fromJson(json['icons']);

  Map<String, dynamic> toJson() => {
        'icons': this.icons?.toJson(),
      };
}
