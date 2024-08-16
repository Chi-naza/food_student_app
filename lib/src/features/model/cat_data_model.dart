class CatDataModel {
  String? breed;
  String? country;
  String? origin;
  String? coat;
  String? pattern;

  CatDataModel({
    this.breed,
    this.country,
    this.coat,
    this.origin,
    this.pattern,
  });

  CatDataModel.fromJson(Map<String, dynamic> json) {
    breed = json["breed"];
    country = json["country"];
    origin = json["origin"];
    coat = json["coat"];
    pattern = json["pattern"];
  }
}
