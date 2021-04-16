import 'package:pokemon_app/model/other.dart';
import 'package:pokemon_app/model/versions.dart';
class Sprites {
	String backDefault;
	Object backFemale;
	String backShiny;
	Object backShinyFemale;
	String frontDefault;
	Object frontFemale;
	String frontShiny;
	Object frontShinyFemale;
	Other other;
	Versions versions;

	Sprites.fromJson(Map<String, dynamic> json)
			:	backDefault = json['back_default'],
	backFemale = json['back_female'],
	backShiny = json['back_shiny'],
	backShinyFemale = json['back_shiny_female'],
	frontDefault = json['front_default'],
	frontFemale = json['front_female'],
	frontShiny = json['front_shiny'],
	frontShinyFemale = json['front_shiny_female'],
	other = Other.fromJson(json['other']),
	versions = Versions.fromJson(json['versions']);

	Map<String, dynamic> toJson() => {
				'back_default': this.backDefault,
				'back_female': this.backFemale,
				'back_shiny': this.backShiny,
				'back_shiny_female': this.backShinyFemale,
				'front_default': this.frontDefault,
				'front_female': this.frontFemale,
				'front_shiny': this.frontShiny,
				'front_shiny_female': this.frontShinyFemale,
				'other': this.other?.toJson(),
				'versions': this.versions?.toJson(),
			};
}
