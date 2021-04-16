import 'package:pokemon_app/model/version.dart';
class GameIndices {
	int gameIndex;
	Version version;

	GameIndices.fromJson(Map<String, dynamic> json)
			:	gameIndex = json['game_index'],
	version = Version.fromJson(json['version']);

	Map<String, dynamic> toJson() => {
				'game_index': this.gameIndex,
				'version': this.version?.toJson(),
			};
}
