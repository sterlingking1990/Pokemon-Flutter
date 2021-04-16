class DreamWorld {
	String frontDefault;
	Object frontFemale;

	DreamWorld.fromJson(Map<String, dynamic> json)
			:	frontDefault = json['front_default'],
	frontFemale = json['front_female'];

	Map<String, dynamic> toJson() => {
				'front_default': this.frontDefault,
				'front_female': this.frontFemale,
			};
}
