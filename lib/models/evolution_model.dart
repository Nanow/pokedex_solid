import 'package:pokedex_youtube/domain/entities/evolution_entity.dart';

class EvolutionModel {
  String? number;
  String? name;

  EvolutionModel({this.number, this.name});

  EvolutionModel.fromJson(Map<String, dynamic> json) {
    number = json['num'];
    name = json['name'];
  }

  EvolutionEntity toEntity() {
    return EvolutionEntity(name: name, number: number);
  }
}
