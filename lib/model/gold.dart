class Gold {
	String backDefault;
	String backShiny;
	String frontDefault;
	String frontShiny;

	Gold.fromJson(Map<String, dynamic> json)
			:	backDefault = json['back_default'],
	backShiny = json['back_shiny'],
	frontDefault = json['front_default'],
	frontShiny = json['front_shiny'];

	Map<String, dynamic> toJson() => {
				'back_default': this.backDefault,
				'back_shiny': this.backShiny,
				'front_default': this.frontDefault,
				'front_shiny': this.frontShiny,
			};
}
