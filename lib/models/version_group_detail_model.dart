import 'ability_description_model.dart';

class VersionGroupDetailModel {
  int? levelLearnedAt;
  InfoDescriptionModel? moveLearnMethod;
  InfoDescriptionModel? versionGroup;

  VersionGroupDetailModel(
      {this.levelLearnedAt, this.moveLearnMethod, this.versionGroup});

  VersionGroupDetailModel.fromJson(Map<String, dynamic> json) {
    levelLearnedAt = json['level_learned_at'];
    moveLearnMethod = json['move_learn_method'] != null
        ? new InfoDescriptionModel.fromJson(json['move_learn_method'])
        : null;
    versionGroup = json['version_group'] != null
        ? new InfoDescriptionModel.fromJson(json['version_group'])
        : null;
  }
}
