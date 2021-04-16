class Officialartwork {
  String frontDefault;

  Officialartwork.fromJson(Map<String, dynamic> json)
      : frontDefault = json['front_default'];

  Map<String, dynamic> toJson() => {
        'front_default': this.frontDefault,
      };
}
