import 'package:pokemon_app/model/move_learn_method.dart';
import 'package:pokemon_app/model/version_group.dart';
class VersionGroupDetails {
	int levelLearnedAt;
	MoveLearnMethod moveLearnMethod;
	VersionGroup versionGroup;

	VersionGroupDetails.fromJson(Map<String, dynamic> json)
			:	levelLearnedAt = json['level_learned_at'],
	moveLearnMethod = MoveLearnMethod.fromJson(json['move_learn_method']),
	versionGroup = VersionGroup.fromJson(json['version_group']);

	Map<String, dynamic> toJson() => {
				'level_learned_at': this.levelLearnedAt,
				'move_learn_method': this.moveLearnMethod?.toJson(),
				'version_group': this.versionGroup?.toJson(),
			};
}
