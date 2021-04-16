import 'package:pokemon_app/model/crystal.dart';
import 'package:pokemon_app/model/gold.dart';
import 'package:pokemon_app/model/silver.dart';

class Generationii {
  Crystal crystal;
  Gold gold;
  Silver silver;

  Generationii.fromJson(Map<String, dynamic> json)
      : crystal = Crystal.fromJson(json['crystal']),
        gold = Gold.fromJson(json['gold']),
        silver = Silver.fromJson(json['silver']);

  Map<String, dynamic> toJson() => {
        'crystal': this.crystal?.toJson(),
        'gold': this.gold?.toJson(),
        'silver': this.silver?.toJson(),
      };
}
