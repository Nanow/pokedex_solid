class InfoDescriptionModel {
  String? name;
  String? url;

  InfoDescriptionModel({this.name, this.url});

  factory InfoDescriptionModel.fromJson(Map<String, dynamic> map) {
    return InfoDescriptionModel(
      name: map['name'] != null ? map['name'] : null,
      url: map['url'] != null ? map['url'] : null,
    );
  }
}
