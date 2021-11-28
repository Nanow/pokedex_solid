import 'evolution_model.dart';

class PokemonModel {
  final int? id;
  final String? num;
  final String name;
  final String? img;
  final List<String>? type;
  final String height;
  final String? weight;
  final String? candy;
  final String? egg;
  final List<EvolutionModel>? nextEvolution;
  final List<EvolutionModel>? prevEvolution;

  PokemonModel(
      this.id,
      this.num,
      this.name,
      this.img,
      this.type,
      this.height,
      this.weight,
      this.candy,
      this.egg,
      this.nextEvolution,
      this.prevEvolution);

  factory PokemonModel.fromJson(Map<String, dynamic> map) {
    return PokemonModel(
      map['id'] != null ? map['id'] : null,
      map['num'] != null ? map['num'] : null,
      map['name'],
      map['img'] != null ? map['img'] : null,
      map['type'] != null ? List<String>.from(map['type']) : null,
      map['height'],
      map['weight'] != null ? map['weight'] : null,
      map['candy'] != null ? map['candy'] : null,
      map['egg'] != null ? map['egg'] : null,
      map['nextEvolution'] != null
          ? List<EvolutionModel>.from(
              map['nextEvolution']?.map((x) => EvolutionModel.fromJson(x)))
          : null,
      map['prevEvolution'] != null
          ? List<EvolutionModel>.from(
              map['prevEvolution']?.map((x) => EvolutionModel.fromJson(x)))
          : null,
    );
  }
}
