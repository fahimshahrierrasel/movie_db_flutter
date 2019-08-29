import 'dart:convert';

class ActorDetails {
  DateTime birthday;
  int id;
  String name;
  String biography;
  double popularity;
  String placeOfBirth;
  String profilePath;

  ActorDetails({
    this.birthday,
    this.id,
    this.name,
    this.biography,
    this.popularity,
    this.placeOfBirth,
    this.profilePath,
  });

  factory ActorDetails.fromRawJson(String str) =>
      ActorDetails.fromJson(json.decode(str));

  factory ActorDetails.fromJson(Map<String, dynamic> json) => new ActorDetails(
        birthday: DateTime.parse(json["birthday"]),
        id: json["id"],
        name: json["name"],
        biography: json["biography"],
        popularity: json["popularity"].toDouble(),
        placeOfBirth: json["place_of_birth"],
        profilePath: json["profile_path"],
      );
}
