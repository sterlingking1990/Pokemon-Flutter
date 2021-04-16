import 'package:pokemon_app/model/animated.dart';

class Blackwhite {
  Animated animated;
  String backDefault;
  Object backFemale;
  String backShiny;
  Object backShinyFemale;
  String frontDefault;
  Object frontFemale;
  String frontShiny;
  Object frontShinyFemale;

  Blackwhite.fromJson(Map<String, dynamic> json)
      : animated = Animated.fromJson(json['animated']),
        backDefault = json['back_default'],
        backFemale = json['back_female'],
        backShiny = json['back_shiny'],
        backShinyFemale = json['back_shiny_female'],
        frontDefault = json['front_default'],
        frontFemale = json['front_female'],
        frontShiny = json['front_shiny'],
        frontShinyFemale = json['front_shiny_female'];

  Map<String, dynamic> toJson() => {
        'animated': this.animated?.toJson(),
        'back_default': this.backDefault,
        'back_female': this.backFemale,
        'back_shiny': this.backShiny,
        'back_shiny_female': this.backShinyFemale,
        'front_default': this.frontDefault,
        'front_female': this.frontFemale,
        'front_shiny': this.frontShiny,
        'front_shiny_female': this.frontShinyFemale,
      };
}
