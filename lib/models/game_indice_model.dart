import 'pokemon_detail_model.dart';

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
