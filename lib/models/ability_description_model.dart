class AbilityDescriptionModel {
  String? name;
  String? url;

  AbilityDescriptionModel({this.name, this.url});

  factory AbilityDescriptionModel.fromJson(Map<String, dynamic> map) {
    return AbilityDescriptionModel(
      name: map['name'] != null ? map['name'] : null,
      url: map['url'] != null ? map['url'] : null,
    );
  }
}
