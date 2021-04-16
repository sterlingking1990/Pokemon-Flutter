class Xy {
  String frontDefault;
  Object frontFemale;
  String frontShiny;
  Object frontShinyFemale;

  Xy.fromJson(Map<String, dynamic> json)
      : frontDefault = json['front_default'],
        frontFemale = json['front_female'],
        frontShiny = json['front_shiny'],
        frontShinyFemale = json['front_shiny_female'];

  Map<String, dynamic> toJson() => {
        'front_default': this.frontDefault,
        'front_female': this.frontFemale,
        'front_shiny': this.frontShiny,
        'front_shiny_female': this.frontShinyFemale,
      };
}
