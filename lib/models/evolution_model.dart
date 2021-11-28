class EvolutionModel {
  String? number;
  String? name;

  EvolutionModel({this.number, this.name});

  EvolutionModel.fromJson(Map<String, dynamic> json) {
    number = json['num'];
    name = json['name'];
  }
}
