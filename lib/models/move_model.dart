import 'ability_description_model.dart';
import 'version_group_detail_model.dart';

class MoveModel {
  InfoDescriptionModel? move;
  List<VersionGroupDetailModel>? versionGroupDetails;

  MoveModel({this.move, this.versionGroupDetails});

  MoveModel.fromJson(Map<String, dynamic> json) {
    move = json['move'] != null
        ? new InfoDescriptionModel.fromJson(json['move'])
        : null;
    if (json['version_group_details'] != null) {
      versionGroupDetails = <VersionGroupDetailModel>[];
      json['version_group_details'].forEach((v) {
        versionGroupDetails!.add(new VersionGroupDetailModel.fromJson(v));
      });
    }
  }
}
