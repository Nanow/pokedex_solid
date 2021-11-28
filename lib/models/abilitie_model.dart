import 'ability_description_model.dart';

class AbilitieModel {
  AbilityDescriptionModel? ability;
  bool? isHidden;
  int? slot;

  AbilitieModel({this.ability, this.isHidden, this.slot});

  AbilitieModel.fromJson(Map<String, dynamic> json) {
    ability = json['ability'] != null
        ? new AbilityDescriptionModel.fromJson(json['ability'])
        : null;
    isHidden = json['is_hidden'];
    slot = json['slot'];
  }
}
