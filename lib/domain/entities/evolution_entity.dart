class EvolutionEntity {
  String? number;
  String? name;

  EvolutionEntity({this.number, this.name});

  EvolutionEntity.fromJson(Map<String, dynamic> json) {
    number = json['num'];
    name = json['name'];
  }
}
