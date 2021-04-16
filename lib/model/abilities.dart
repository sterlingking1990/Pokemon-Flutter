import 'package:pokemon_app/model/ability.dart';
class Abilities {
	Ability ability;
	bool isHidden;
	int slot;

	Abilities.fromJson(Map<String, dynamic> json)
			:	ability = Ability.fromJson(json['ability']),
	isHidden = json['is_hidden'],
	slot = json['slot'];

	Map<String, dynamic> toJson() => {
				'ability': this.ability?.toJson(),
				'is_hidden': this.isHidden,
				'slot': this.slot,
			};
}
