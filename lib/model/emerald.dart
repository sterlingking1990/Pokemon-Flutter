class Emerald {
	String frontDefault;
	String frontShiny;

	Emerald.fromJson(Map<String, dynamic> json)
			:	frontDefault = json['front_default'],
	frontShiny = json['front_shiny'];

	Map<String, dynamic> toJson() => {
				'front_default': this.frontDefault,
				'front_shiny': this.frontShiny,
			};
}
