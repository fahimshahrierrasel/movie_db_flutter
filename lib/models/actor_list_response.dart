import 'dart:convert';

class ActorResponse {
  int page;
  List<Actor> actors;
  int totalResults;
  int totalPages;

  ActorResponse({
    this.page,
    this.actors,
    this.totalResults,
    this.totalPages,
  });

  factory ActorResponse.fromRawJson(String str) =>
      ActorResponse.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ActorResponse.fromJson(Map<String, dynamic> json) =>
      new ActorResponse(
        page: json["page"],
        actors:
            new List<Actor>.from(json["results"].map((x) => Actor.fromJson(x))),
        totalResults: json["total_results"],
        totalPages: json["total_pages"],
      );

  Map<String, dynamic> toJson() => {
        "page": page,
        "results": new List<Actor>.from(actors.map((x) => x.toJson())),
        "total_results": totalResults,
        "total_pages": totalPages,
      };
}

class Actor {
  String profilePath;
  int id;
  String name;

  Actor({
    this.profilePath,
    this.id,
    this.name,
  });

  factory Actor.fromRawJson(String str) => Actor.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Actor.fromJson(Map<String, dynamic> json) => new Actor(
        profilePath: json["profile_path"],
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "profile_path": profilePath,
        "id": id,
        "name": name,
      };
}
