class Yellow {
	String backDefault;
	String backGray;
	String frontDefault;
	String frontGray;

	Yellow.fromJson(Map<String, dynamic> json)
			:	backDefault = json['back_default'],
	backGray = json['back_gray'],
	frontDefault = json['front_default'],
	frontGray = json['front_gray'];

	Map<String, dynamic> toJson() => {
				'back_default': this.backDefault,
				'back_gray': this.backGray,
				'front_default': this.frontDefault,
				'front_gray': this.frontGray,
			};
}
