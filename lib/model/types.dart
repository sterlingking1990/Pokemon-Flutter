import 'package:pokemon_app/model/type.dart';
class Types {
	int slot;
	Type type;

	Types.fromJson(Map<String, dynamic> json)
			:	slot = json['slot'],
	type = Type.fromJson(json['type']);

	Map<String, dynamic> toJson() => {
				'slot': this.slot,
				'type': this.type?.toJson(),
			};
}
