import 'abilitie_model.dart';

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
  AbilityModel? species;
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
        ? new AbilityModel.fromJson(json['species'])
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

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.abilities != null) {
      data['abilities'] = this.abilities!.map((v) => v.toJson()).toList();
    }
    data['base_experience'] = this.baseExperience;
    if (this.gameIndices != null) {
      data['game_indices'] = this.gameIndices!.map((v) => v.toJson()).toList();
    }
    data['height'] = this.height;
    data['id'] = this.id;
    data['is_default'] = this.isDefault;
    data['location_area_encounters'] = this.locationAreaEncounters;
    if (this.moves != null) {
      data['moves'] = this.moves!.map((v) => v.toJson()).toList();
    }
    data['name'] = this.name;
    data['order'] = this.order;
    if (this.species != null) {
      data['species'] = this.species!.toJson();
    }
    if (this.stats != null) {
      data['stats'] = this.stats!.map((v) => v.toJson()).toList();
    }
    if (this.types != null) {
      data['types'] = this.types!.map((v) => v.toJson()).toList();
    }
    data['weight'] = this.weight;
    return data;
  }
}

class AbilityModel {
  String? name;
  String? url;

  AbilityModel({this.name, this.url});

  AbilityModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['url'] = this.url;
    return data;
  }
}

class GameIndiceModel {
  int? gameIndex;
  AbilityModel? version;

  GameIndiceModel({this.gameIndex, this.version});

  GameIndiceModel.fromJson(Map<String, dynamic> json) {
    gameIndex = json['game_index'];
    version = json['version'] != null
        ? new AbilityModel.fromJson(json['version'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['game_index'] = this.gameIndex;
    if (this.version != null) {
      data['version'] = this.version!.toJson();
    }
    return data;
  }
}

class MoveModel {
  AbilityModel? move;
  List<VersionGroupDetailModel>? versionGroupDetails;

  MoveModel({this.move, this.versionGroupDetails});

  MoveModel.fromJson(Map<String, dynamic> json) {
    move =
        json['move'] != null ? new AbilityModel.fromJson(json['move']) : null;
    if (json['version_group_details'] != null) {
      versionGroupDetails = <VersionGroupDetailModel>[];
      json['version_group_details'].forEach((v) {
        versionGroupDetails!.add(new VersionGroupDetailModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.move != null) {
      data['move'] = this.move!.toJson();
    }
    if (this.versionGroupDetails != null) {
      data['version_group_details'] =
          this.versionGroupDetails!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class VersionGroupDetailModel {
  int? levelLearnedAt;
  AbilityModel? moveLearnMethod;
  AbilityModel? versionGroup;

  VersionGroupDetailModel(
      {this.levelLearnedAt, this.moveLearnMethod, this.versionGroup});

  VersionGroupDetailModel.fromJson(Map<String, dynamic> json) {
    levelLearnedAt = json['level_learned_at'];
    moveLearnMethod = json['move_learn_method'] != null
        ? new AbilityModel.fromJson(json['move_learn_method'])
        : null;
    versionGroup = json['version_group'] != null
        ? new AbilityModel.fromJson(json['version_group'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['level_learned_at'] = this.levelLearnedAt;
    if (this.moveLearnMethod != null) {
      data['move_learn_method'] = this.moveLearnMethod!.toJson();
    }
    if (this.versionGroup != null) {
      data['version_group'] = this.versionGroup!.toJson();
    }
    return data;
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
  AbilityModel? stat;

  StatModel({this.baseStat, this.effort, this.stat});

  StatModel.fromJson(Map<String, dynamic> json) {
    baseStat = json['base_stat'];
    effort = json['effort'];
    stat =
        json['stat'] != null ? new AbilityModel.fromJson(json['stat']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['base_stat'] = this.baseStat;
    data['effort'] = this.effort;
    if (this.stat != null) {
      data['stat'] = this.stat!.toJson();
    }
    return data;
  }
}

class TypeModel {
  int? slot;
  AbilityModel? type;

  TypeModel({this.slot, this.type});

  TypeModel.fromJson(Map<String, dynamic> json) {
    slot = json['slot'];
    type =
        json['type'] != null ? new AbilityModel.fromJson(json['type']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['slot'] = this.slot;
    if (this.type != null) {
      data['type'] = this.type!.toJson();
    }
    return data;
  }
}
