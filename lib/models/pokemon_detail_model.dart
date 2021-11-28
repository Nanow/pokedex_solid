import 'abilitie_model.dart';
import 'ability_description_model.dart';

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
  AbilityDescriptionModel? species;
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
        ? new AbilityDescriptionModel.fromJson(json['species'])
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

class GameIndiceModel {
  int? gameIndex;
  AbilityDescriptionModel? version;

  GameIndiceModel({this.gameIndex, this.version});

  GameIndiceModel.fromJson(Map<String, dynamic> json) {
    gameIndex = json['game_index'];
    version = json['version'] != null
        ? new AbilityDescriptionModel.fromJson(json['version'])
        : null;
  }
}

class MoveModel {
  AbilityDescriptionModel? move;
  List<VersionGroupDetailModel>? versionGroupDetails;

  MoveModel({this.move, this.versionGroupDetails});

  MoveModel.fromJson(Map<String, dynamic> json) {
    move = json['move'] != null
        ? new AbilityDescriptionModel.fromJson(json['move'])
        : null;
    if (json['version_group_details'] != null) {
      versionGroupDetails = <VersionGroupDetailModel>[];
      json['version_group_details'].forEach((v) {
        versionGroupDetails!.add(new VersionGroupDetailModel.fromJson(v));
      });
    }
  }
}

class VersionGroupDetailModel {
  int? levelLearnedAt;
  AbilityDescriptionModel? moveLearnMethod;
  AbilityDescriptionModel? versionGroup;

  VersionGroupDetailModel(
      {this.levelLearnedAt, this.moveLearnMethod, this.versionGroup});

  VersionGroupDetailModel.fromJson(Map<String, dynamic> json) {
    levelLearnedAt = json['level_learned_at'];
    moveLearnMethod = json['move_learn_method'] != null
        ? new AbilityDescriptionModel.fromJson(json['move_learn_method'])
        : null;
    versionGroup = json['version_group'] != null
        ? new AbilityDescriptionModel.fromJson(json['version_group'])
        : null;
  }
}

class SpriteModel {
  String? backDefault;
  Null backFemale;
  String? backShiny;
  Null backShinyFemale;
  String? frontDefault;
  Null frontFemale;
  String? frontShiny;
  Null frontShinyFemale;

  SpriteModel(
      {this.backDefault,
      this.backFemale,
      this.backShiny,
      this.backShinyFemale,
      this.frontDefault,
      this.frontFemale,
      this.frontShiny,
      this.frontShinyFemale});

  SpriteModel.fromJson(Map<String, dynamic> json) {
    backDefault = json['back_default'];
    backFemale = json['back_female'];
    backShiny = json['back_shiny'];
    backShinyFemale = json['back_shiny_female'];
    frontDefault = json['front_default'];
    frontFemale = json['front_female'];
    frontShiny = json['front_shiny'];
    frontShinyFemale = json['front_shiny_female'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['back_default'] = this.backDefault;
    data['back_female'] = this.backFemale;
    data['back_shiny'] = this.backShiny;
    data['back_shiny_female'] = this.backShinyFemale;
    data['front_default'] = this.frontDefault;
    data['front_female'] = this.frontFemale;
    data['front_shiny'] = this.frontShiny;
    data['front_shiny_female'] = this.frontShinyFemale;
    return data;
  }
}

class StatModel {
  int? baseStat;
  int? effort;
  AbilityDescriptionModel? stat;

  StatModel({this.baseStat, this.effort, this.stat});

  StatModel.fromJson(Map<String, dynamic> json) {
    baseStat = json['base_stat'];
    effort = json['effort'];
    stat = json['stat'] != null
        ? new AbilityDescriptionModel.fromJson(json['stat'])
        : null;
  }
}

class TypeModel {
  int? slot;
  AbilityDescriptionModel? type;

  TypeModel({this.slot, this.type});

  TypeModel.fromJson(Map<String, dynamic> json) {
    slot = json['slot'];
    type = json['type'] != null
        ? new AbilityDescriptionModel.fromJson(json['type'])
        : null;
  }
}
