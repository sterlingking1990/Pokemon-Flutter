import 'package:pokemon_app/model/move.dart';
import 'package:pokemon_app/model/version_group_details.dart';
class Moves {
	Move move;
	List<VersionGroupDetails> versionGroupDetails;

	Moves.fromJson(Map<String, dynamic> json)
			:	move = Move.fromJson(json['move']),
	versionGroupDetails = List<VersionGroupDetails>.from(
		json['version_group_details'].map((e) => VersionGroupDetails.fromJson(e)),	
);

	Map<String, dynamic> toJson() => {
				'move': this.move?.toJson(),
				'version_group_details': this.versionGroupDetails?.map((e) => e.toJson())?.toList(),
			};
}
