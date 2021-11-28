import 'ability_description_model.dart';

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
