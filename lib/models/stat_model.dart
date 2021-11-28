import 'ability_description_model.dart';

class StatModel {
  int? baseStat;
  int? effort;
  InfoDescriptionModel? stat;

  StatModel({this.baseStat, this.effort, this.stat});

  StatModel.fromJson(Map<String, dynamic> json) {
    baseStat = json['base_stat'];
    effort = json['effort'];
    stat = json['stat'] != null
        ? new InfoDescriptionModel.fromJson(json['stat'])
        : null;
  }
}
