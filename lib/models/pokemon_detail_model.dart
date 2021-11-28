import 'abilitie_model.dart';
import 'ability_description_model.dart';
import 'game_indice_model.dart';
import 'move_model.dart';
import 'stat_model.dart';
import 'type_model.dart';

class PokemonDetailModel {
  List<AbilitieModel>? abilities;
  int? baseExperience;
  List<GameIndiceModel>? gameIndices;
  List<Null>? heldItems;
  int? height;
  int? id;
  bool? isDefault;
  String? locationAreaEncounters;
  List<MoveModel>? moves;
  String? name;
  int? order;
  InfoDescriptionModel? species;
  List<StatModel>? stats;
  List<TypeModel>? types;
  int? weight;

  PokemonDetailModel({
    this.abilities,
    this.baseExperience,
    this.gameIndices,
    this.heldItems,
    this.height,
    this.id,
    this.isDefault,
    this.locationAreaEncounters,
    this.moves,
    this.name,
    this.order,
    this.species,
    this.stats,
    this.types,
    this.weight,
  });

  PokemonDetailModel.fromJson(Map<String, dynamic> json) {
    if (json['abilities'] != null) {
      abilities = <AbilitieModel>[];
      json['abilities'].forEach((v) {
        abilities!.add(new AbilitieModel.fromJson(v));
      });
    }
    baseExperience = json['base_experience'];
    if (json['game_indices'] != null) {
      gameIndices = <GameIndiceModel>[];
      json['game_indices'].forEach((v) {
        gameIndices!.add(new GameIndiceModel.fromJson(v));
      });
    }
    height = json['height'];
    id = json['id'];
    isDefault = json['is_default'];
    locationAreaEncounters = json['location_area_encounters'];
    if (json['moves'] != null) {
      moves = <MoveModel>[];
      json['moves'].forEach((v) {
        moves!.add(new MoveModel.fromJson(v));
      });
    }
    name = json['name'];
    order = json['order'];
    species = json['species'] != null
        ? new InfoDescriptionModel.fromJson(json['species'])
        : null;
    if (json['stats'] != null) {
      stats = <StatModel>[];
      json['stats'].forEach((v) {
        stats!.add(new StatModel.fromJson(v));
      });
    }
    if (json['types'] != null) {
      types = <TypeModel>[];
      json['types'].forEach((v) {
        types!.add(new TypeModel.fromJson(v));
      });
    }
    weight = json['weight'];
  }
}
