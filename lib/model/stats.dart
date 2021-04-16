import 'package:pokemon_app/model/stat.dart';
class Stats {
	int baseStat;
	int effort;
	Stat stat;

	Stats.fromJson(Map<String, dynamic> json)
			:	baseStat = json['base_stat'],
	effort = json['effort'],
	stat = Stat.fromJson(json['stat']);

	Map<String, dynamic> toJson() => {
				'base_stat': this.baseStat,
				'effort': this.effort,
				'stat': this.stat?.toJson(),
			};
}
