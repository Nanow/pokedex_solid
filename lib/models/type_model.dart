import 'ability_description_model.dart';

class TypeModel {
  int? slot;
  InfoDescriptionModel? type;

  TypeModel({this.slot, this.type});

  TypeModel.fromJson(Map<String, dynamic> json) {
    slot = json['slot'];
    type = json['type'] != null
        ? new InfoDescriptionModel.fromJson(json['type'])
        : null;
  }
}
