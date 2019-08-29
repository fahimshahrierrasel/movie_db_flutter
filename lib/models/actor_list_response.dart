import 'dart:convert';

class ActorListResponse {
  int page;
  List<Actor> actors;
  int totalResults;
  int totalPages;

  ActorListResponse({
    this.page,
    this.actors,
    this.totalResults,
    this.totalPages,
  });

  factory ActorListResponse.fromRawJson(String str) =>
      ActorListResponse.fromJson(json.decode(str));

  factory ActorListResponse.fromJson(Map<String, dynamic> json) =>
      new ActorListResponse(
        page: json["page"],
        actors:
            new List<Actor>.from(json["results"].map((x) => Actor.fromJson(x))),
        totalResults: json["total_results"],
        totalPages: json["total_pages"],
      );

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

  factory Actor.fromJson(Map<String, dynamic> json) => new Actor(
        profilePath: json["profile_path"],
        id: json["id"],
        name: json["name"],
      );
}
