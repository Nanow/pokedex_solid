import 'ability_entity.dart';

class PokemonDetailEntity {
  List<AbilitieEntity>? abilities;
  int? baseExperience;
  List<GameIndiceEntity>? gameIndices;
  int? height;
  int? id;
  bool? isDefault;
  String? locationAreaEncounters;
  List<MoveEntity>? moves;
  String? name;
  int? order;
  AbilityEntity? species;
  List<StatEntity>? stats;
  List<TypeEntity>? types;
  int? weight;

  PokemonDetailEntity({
    this.abilities,
    this.baseExperience,
    this.gameIndices,
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
}

class GameIndiceEntity {
  final int? gameIndex;
  final AbilityEntity? version;

  GameIndiceEntity({required this.gameIndex, required this.version});
}

class AbilityEntity {
  final String? name;
  final String? url;

  AbilityEntity({required this.name, required this.url});
}

class MoveEntity {
  final AbilityEntity? move;
  final List<VersionGroupDetailEntity>? versionGroupDetails;

  MoveEntity({
    this.move,
    this.versionGroupDetails,
  });
}

class VersionGroupDetailEntity {
  final int? levelLearnedAt;
  final AbilityEntity? moveLearnMethod;
  final AbilityEntity? versionGroup;

  VersionGroupDetailEntity({
    required this.levelLearnedAt,
    required this.moveLearnMethod,
    required this.versionGroup,
  });
}

class TypeEntity {
  final int? slot;
  final AbilityEntity? type;

  TypeEntity({
    required this.slot,
    required this.type,
  });
}

class StatEntity {
  final String? backDefault;

  final String? backShiny;

  final String? frontDefault;

  final String? frontShiny;

  StatEntity({
    required this.backDefault,
    required this.backShiny,
    required this.frontDefault,
    required this.frontShiny,
  });
}

class StateEntity {
  final int? baseStat;
  final int? effort;
  final AbilityEntity? stat;

  StateEntity({
    required this.baseStat,
    required this.effort,
    required this.stat,
  });
}
